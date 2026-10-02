import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// How many photos one lab report may consist of.
const int maxLabPages = 10;

/// Longest side of a page after downscaling — plenty for OCR, and keeps a
/// 10-page PDF well under Gemini's inline request size limit.
const int _maxPageSide = 2000;

/// One photographed page of a lab report, already normalized: upright
/// (EXIF orientation baked in), downscaled, re-encoded as JPEG with all
/// metadata (GPS, device...) stripped. The redaction screen draws over these
/// exact bytes, so relative box coordinates match what the server sees.
class LabPage {
  const LabPage({required this.bytes, required this.width, required this.height});

  final Uint8List bytes;
  final int width;
  final int height;

  double get aspectRatio => width / height;
}

/// Decodes and normalizes a photo off the UI isolate. Throws
/// [FormatException] if the file isn't a readable image.
Future<LabPage> prepareLabPage(String path) {
  return Isolate.run(() {
    final decoded = img.decodeImage(File(path).readAsBytesSync());
    if (decoded == null) {
      throw const FormatException('Unreadable image');
    }
    var image = img.bakeOrientation(decoded);
    if (math.max(image.width, image.height) > _maxPageSide) {
      image =
          image.width >= image.height
              ? img.copyResize(image, width: _maxPageSide)
              : img.copyResize(image, height: _maxPageSide);
    }
    image.exif = img.ExifData();
    return LabPage(bytes: img.encodeJpg(image, quality: 85), width: image.width, height: image.height);
  });
}

/// Writes the pages to a temp file ready for upload: a single page goes as
/// a JPEG, several are combined into one multi-page PDF (one image per
/// page) — the backend redacts PDFs per page and OCRs the whole document in
/// one pass, so all pages end up in a single report.
Future<File> writeLabPagesFile(List<LabPage> pages) async {
  final dir = await Directory.systemTemp.createTemp('lab_upload_');
  if (pages.length == 1) {
    return File('${dir.path}/report.jpg').writeAsBytes(pages.single.bytes);
  }
  final pdfBytes = await Isolate.run(() => _buildPdf(pages));
  return File('${dir.path}/report.pdf').writeAsBytes(pdfBytes);
}

Future<Uint8List> _buildPdf(List<LabPage> pages) {
  final document = pw.Document();
  for (final page in pages) {
    final image = pw.MemoryImage(page.bytes);
    document.addPage(
      pw.Page(
        // Half a point per pixel: the server rasterizes PDFs at 2x before
        // redacting, which brings each page back to its original pixel size.
        pageFormat: PdfPageFormat(page.width / 2, page.height / 2),
        margin: pw.EdgeInsets.zero,
        build: (_) => pw.Image(image, fit: pw.BoxFit.fill),
      ),
    );
  }
  return document.save();
}
