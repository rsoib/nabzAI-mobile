// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabReport {

 String get id; String get fileId; String get createdAt; String? get labName; String? get collectedAt; LabReportStatus get status; Urgency? get urgency; String? get specialist; String? get explanationRu; String? get explanationTg; String? get errorMessage; List<LabResult> get results;
/// Create a copy of LabReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabReportCopyWith<LabReport> get copyWith => _$LabReportCopyWithImpl<LabReport>(this as LabReport, _$identity);

  /// Serializes this LabReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabReport&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.labName, labName) || other.labName == labName)&&(identical(other.collectedAt, collectedAt) || other.collectedAt == collectedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.specialist, specialist) || other.specialist == specialist)&&(identical(other.explanationRu, explanationRu) || other.explanationRu == explanationRu)&&(identical(other.explanationTg, explanationTg) || other.explanationTg == explanationTg)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileId,createdAt,labName,collectedAt,status,urgency,specialist,explanationRu,explanationTg,errorMessage,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'LabReport(id: $id, fileId: $fileId, createdAt: $createdAt, labName: $labName, collectedAt: $collectedAt, status: $status, urgency: $urgency, specialist: $specialist, explanationRu: $explanationRu, explanationTg: $explanationTg, errorMessage: $errorMessage, results: $results)';
}


}

/// @nodoc
abstract mixin class $LabReportCopyWith<$Res>  {
  factory $LabReportCopyWith(LabReport value, $Res Function(LabReport) _then) = _$LabReportCopyWithImpl;
@useResult
$Res call({
 String id, String fileId, String createdAt, String? labName, String? collectedAt, LabReportStatus status, Urgency? urgency, String? specialist, String? explanationRu, String? explanationTg, String? errorMessage, List<LabResult> results
});




}
/// @nodoc
class _$LabReportCopyWithImpl<$Res>
    implements $LabReportCopyWith<$Res> {
  _$LabReportCopyWithImpl(this._self, this._then);

  final LabReport _self;
  final $Res Function(LabReport) _then;

/// Create a copy of LabReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileId = null,Object? createdAt = null,Object? labName = freezed,Object? collectedAt = freezed,Object? status = null,Object? urgency = freezed,Object? specialist = freezed,Object? explanationRu = freezed,Object? explanationTg = freezed,Object? errorMessage = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,labName: freezed == labName ? _self.labName : labName // ignore: cast_nullable_to_non_nullable
as String?,collectedAt: freezed == collectedAt ? _self.collectedAt : collectedAt // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LabReportStatus,urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as Urgency?,specialist: freezed == specialist ? _self.specialist : specialist // ignore: cast_nullable_to_non_nullable
as String?,explanationRu: freezed == explanationRu ? _self.explanationRu : explanationRu // ignore: cast_nullable_to_non_nullable
as String?,explanationTg: freezed == explanationTg ? _self.explanationTg : explanationTg // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<LabResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [LabReport].
extension LabReportPatterns on LabReport {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabReport() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabReport value)  $default,){
final _that = this;
switch (_that) {
case _LabReport():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabReport value)?  $default,){
final _that = this;
switch (_that) {
case _LabReport() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileId,  String createdAt,  String? labName,  String? collectedAt,  LabReportStatus status,  Urgency? urgency,  String? specialist,  String? explanationRu,  String? explanationTg,  String? errorMessage,  List<LabResult> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabReport() when $default != null:
return $default(_that.id,_that.fileId,_that.createdAt,_that.labName,_that.collectedAt,_that.status,_that.urgency,_that.specialist,_that.explanationRu,_that.explanationTg,_that.errorMessage,_that.results);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileId,  String createdAt,  String? labName,  String? collectedAt,  LabReportStatus status,  Urgency? urgency,  String? specialist,  String? explanationRu,  String? explanationTg,  String? errorMessage,  List<LabResult> results)  $default,) {final _that = this;
switch (_that) {
case _LabReport():
return $default(_that.id,_that.fileId,_that.createdAt,_that.labName,_that.collectedAt,_that.status,_that.urgency,_that.specialist,_that.explanationRu,_that.explanationTg,_that.errorMessage,_that.results);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileId,  String createdAt,  String? labName,  String? collectedAt,  LabReportStatus status,  Urgency? urgency,  String? specialist,  String? explanationRu,  String? explanationTg,  String? errorMessage,  List<LabResult> results)?  $default,) {final _that = this;
switch (_that) {
case _LabReport() when $default != null:
return $default(_that.id,_that.fileId,_that.createdAt,_that.labName,_that.collectedAt,_that.status,_that.urgency,_that.specialist,_that.explanationRu,_that.explanationTg,_that.errorMessage,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabReport implements LabReport {
  const _LabReport({required this.id, required this.fileId, required this.createdAt, this.labName, this.collectedAt, required this.status, this.urgency, this.specialist, this.explanationRu, this.explanationTg, this.errorMessage, final  List<LabResult> results = const []}): _results = results;
  factory _LabReport.fromJson(Map<String, dynamic> json) => _$LabReportFromJson(json);

@override final  String id;
@override final  String fileId;
@override final  String createdAt;
@override final  String? labName;
@override final  String? collectedAt;
@override final  LabReportStatus status;
@override final  Urgency? urgency;
@override final  String? specialist;
@override final  String? explanationRu;
@override final  String? explanationTg;
@override final  String? errorMessage;
 final  List<LabResult> _results;
@override@JsonKey() List<LabResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of LabReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabReportCopyWith<_LabReport> get copyWith => __$LabReportCopyWithImpl<_LabReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabReport&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.labName, labName) || other.labName == labName)&&(identical(other.collectedAt, collectedAt) || other.collectedAt == collectedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.specialist, specialist) || other.specialist == specialist)&&(identical(other.explanationRu, explanationRu) || other.explanationRu == explanationRu)&&(identical(other.explanationTg, explanationTg) || other.explanationTg == explanationTg)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileId,createdAt,labName,collectedAt,status,urgency,specialist,explanationRu,explanationTg,errorMessage,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'LabReport(id: $id, fileId: $fileId, createdAt: $createdAt, labName: $labName, collectedAt: $collectedAt, status: $status, urgency: $urgency, specialist: $specialist, explanationRu: $explanationRu, explanationTg: $explanationTg, errorMessage: $errorMessage, results: $results)';
}


}

/// @nodoc
abstract mixin class _$LabReportCopyWith<$Res> implements $LabReportCopyWith<$Res> {
  factory _$LabReportCopyWith(_LabReport value, $Res Function(_LabReport) _then) = __$LabReportCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileId, String createdAt, String? labName, String? collectedAt, LabReportStatus status, Urgency? urgency, String? specialist, String? explanationRu, String? explanationTg, String? errorMessage, List<LabResult> results
});




}
/// @nodoc
class __$LabReportCopyWithImpl<$Res>
    implements _$LabReportCopyWith<$Res> {
  __$LabReportCopyWithImpl(this._self, this._then);

  final _LabReport _self;
  final $Res Function(_LabReport) _then;

/// Create a copy of LabReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileId = null,Object? createdAt = null,Object? labName = freezed,Object? collectedAt = freezed,Object? status = null,Object? urgency = freezed,Object? specialist = freezed,Object? explanationRu = freezed,Object? explanationTg = freezed,Object? errorMessage = freezed,Object? results = null,}) {
  return _then(_LabReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,labName: freezed == labName ? _self.labName : labName // ignore: cast_nullable_to_non_nullable
as String?,collectedAt: freezed == collectedAt ? _self.collectedAt : collectedAt // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LabReportStatus,urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as Urgency?,specialist: freezed == specialist ? _self.specialist : specialist // ignore: cast_nullable_to_non_nullable
as String?,explanationRu: freezed == explanationRu ? _self.explanationRu : explanationRu // ignore: cast_nullable_to_non_nullable
as String?,explanationTg: freezed == explanationTg ? _self.explanationTg : explanationTg // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<LabResult>,
  ));
}


}

// dart format on
