import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'camera_capture_screen.dart';

/// Opens the custom capture screen; returns the photo path, or null if the
/// user backed out.
Future<String?> captureLabPhoto(BuildContext context) async {
  final file = await Navigator.of(context).push<File>(MaterialPageRoute(builder: (_) => const CameraCaptureScreen()));
  return file?.path;
}

/// Lets the user pick up to [limit] photos from the gallery. Returns an
/// empty list if they cancelled.
Future<List<String>> pickLabPhotosFromGallery({required int limit}) async {
  final picker = ImagePicker();
  if (limit <= 1) {
    // `pickMultiImage` requires a limit of at least 2.
    final picked = await picker.pickImage(source: ImageSource.gallery);
    return [if (picked != null) picked.path];
  }
  final picked = await picker.pickMultiImage(limit: limit);
  // Not every platform honours `limit` — enforce it here as well.
  return picked.take(limit).map((f) => f.path).toList();
}
