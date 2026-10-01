// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaint_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComplaintSession {

 String get id; ComplaintSessionStatus get status; Urgency? get urgency; String? get specialist; String? get summary; List<String> get redFlags; List<ComplaintMessage> get messages;
/// Create a copy of ComplaintSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComplaintSessionCopyWith<ComplaintSession> get copyWith => _$ComplaintSessionCopyWithImpl<ComplaintSession>(this as ComplaintSession, _$identity);

  /// Serializes this ComplaintSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComplaintSession&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.specialist, specialist) || other.specialist == specialist)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.redFlags, redFlags)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,urgency,specialist,summary,const DeepCollectionEquality().hash(redFlags),const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'ComplaintSession(id: $id, status: $status, urgency: $urgency, specialist: $specialist, summary: $summary, redFlags: $redFlags, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ComplaintSessionCopyWith<$Res>  {
  factory $ComplaintSessionCopyWith(ComplaintSession value, $Res Function(ComplaintSession) _then) = _$ComplaintSessionCopyWithImpl;
@useResult
$Res call({
 String id, ComplaintSessionStatus status, Urgency? urgency, String? specialist, String? summary, List<String> redFlags, List<ComplaintMessage> messages
});




}
/// @nodoc
class _$ComplaintSessionCopyWithImpl<$Res>
    implements $ComplaintSessionCopyWith<$Res> {
  _$ComplaintSessionCopyWithImpl(this._self, this._then);

  final ComplaintSession _self;
  final $Res Function(ComplaintSession) _then;

/// Create a copy of ComplaintSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? urgency = freezed,Object? specialist = freezed,Object? summary = freezed,Object? redFlags = null,Object? messages = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComplaintSessionStatus,urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as Urgency?,specialist: freezed == specialist ? _self.specialist : specialist // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,redFlags: null == redFlags ? _self.redFlags : redFlags // ignore: cast_nullable_to_non_nullable
as List<String>,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ComplaintMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [ComplaintSession].
extension ComplaintSessionPatterns on ComplaintSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComplaintSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComplaintSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComplaintSession value)  $default,){
final _that = this;
switch (_that) {
case _ComplaintSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComplaintSession value)?  $default,){
final _that = this;
switch (_that) {
case _ComplaintSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ComplaintSessionStatus status,  Urgency? urgency,  String? specialist,  String? summary,  List<String> redFlags,  List<ComplaintMessage> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComplaintSession() when $default != null:
return $default(_that.id,_that.status,_that.urgency,_that.specialist,_that.summary,_that.redFlags,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ComplaintSessionStatus status,  Urgency? urgency,  String? specialist,  String? summary,  List<String> redFlags,  List<ComplaintMessage> messages)  $default,) {final _that = this;
switch (_that) {
case _ComplaintSession():
return $default(_that.id,_that.status,_that.urgency,_that.specialist,_that.summary,_that.redFlags,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ComplaintSessionStatus status,  Urgency? urgency,  String? specialist,  String? summary,  List<String> redFlags,  List<ComplaintMessage> messages)?  $default,) {final _that = this;
switch (_that) {
case _ComplaintSession() when $default != null:
return $default(_that.id,_that.status,_that.urgency,_that.specialist,_that.summary,_that.redFlags,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComplaintSession implements ComplaintSession {
  const _ComplaintSession({required this.id, required this.status, this.urgency, this.specialist, this.summary, final  List<String> redFlags = const [], final  List<ComplaintMessage> messages = const []}): _redFlags = redFlags,_messages = messages;
  factory _ComplaintSession.fromJson(Map<String, dynamic> json) => _$ComplaintSessionFromJson(json);

@override final  String id;
@override final  ComplaintSessionStatus status;
@override final  Urgency? urgency;
@override final  String? specialist;
@override final  String? summary;
 final  List<String> _redFlags;
@override@JsonKey() List<String> get redFlags {
  if (_redFlags is EqualUnmodifiableListView) return _redFlags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_redFlags);
}

 final  List<ComplaintMessage> _messages;
@override@JsonKey() List<ComplaintMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ComplaintSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComplaintSessionCopyWith<_ComplaintSession> get copyWith => __$ComplaintSessionCopyWithImpl<_ComplaintSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComplaintSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComplaintSession&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.specialist, specialist) || other.specialist == specialist)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._redFlags, _redFlags)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,urgency,specialist,summary,const DeepCollectionEquality().hash(_redFlags),const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ComplaintSession(id: $id, status: $status, urgency: $urgency, specialist: $specialist, summary: $summary, redFlags: $redFlags, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$ComplaintSessionCopyWith<$Res> implements $ComplaintSessionCopyWith<$Res> {
  factory _$ComplaintSessionCopyWith(_ComplaintSession value, $Res Function(_ComplaintSession) _then) = __$ComplaintSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, ComplaintSessionStatus status, Urgency? urgency, String? specialist, String? summary, List<String> redFlags, List<ComplaintMessage> messages
});




}
/// @nodoc
class __$ComplaintSessionCopyWithImpl<$Res>
    implements _$ComplaintSessionCopyWith<$Res> {
  __$ComplaintSessionCopyWithImpl(this._self, this._then);

  final _ComplaintSession _self;
  final $Res Function(_ComplaintSession) _then;

/// Create a copy of ComplaintSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? urgency = freezed,Object? specialist = freezed,Object? summary = freezed,Object? redFlags = null,Object? messages = null,}) {
  return _then(_ComplaintSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComplaintSessionStatus,urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as Urgency?,specialist: freezed == specialist ? _self.specialist : specialist // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,redFlags: null == redFlags ? _self._redFlags : redFlags // ignore: cast_nullable_to_non_nullable
as List<String>,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ComplaintMessage>,
  ));
}


}

// dart format on
