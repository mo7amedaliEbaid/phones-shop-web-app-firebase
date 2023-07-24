// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contact_us_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactUsModel _$ContactUsModelFromJson(Map<String, dynamic> json) {
  return _ContactUsModel.fromJson(json);
}

/// @nodoc
class _$ContactUsModelTearOff {
  const _$ContactUsModelTearOff();

  _ContactUsModel call(
      {required String uid,
      required String name,
      required String email,
      required String topic,
      required String message}) {
    return _ContactUsModel(
      uid: uid,
      name: name,
      email: email,
      topic: topic,
      message: message,
    );
  }

  ContactUsModel fromJson(Map<String, Object?> json) {
    return ContactUsModel.fromJson(json);
  }
}

/// @nodoc
const $ContactUsModel = _$ContactUsModelTearOff();

/// @nodoc
mixin _$ContactUsModel {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactUsModelCopyWith<ContactUsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsModelCopyWith<$Res> {
  factory $ContactUsModelCopyWith(
          ContactUsModel value, $Res Function(ContactUsModel) then) =
      _$ContactUsModelCopyWithImpl<$Res>;
  $Res call(
      {String uid, String name, String email, String topic, String message});
}

/// @nodoc
class _$ContactUsModelCopyWithImpl<$Res>
    implements $ContactUsModelCopyWith<$Res> {
  _$ContactUsModelCopyWithImpl(this._value, this._then);

  final ContactUsModel _value;
  // ignore: unused_field
  final $Res Function(ContactUsModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? topic = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ContactUsModelCopyWith<$Res>
    implements $ContactUsModelCopyWith<$Res> {
  factory _$ContactUsModelCopyWith(
          _ContactUsModel value, $Res Function(_ContactUsModel) then) =
      __$ContactUsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid, String name, String email, String topic, String message});
}

/// @nodoc
class __$ContactUsModelCopyWithImpl<$Res>
    extends _$ContactUsModelCopyWithImpl<$Res>
    implements _$ContactUsModelCopyWith<$Res> {
  __$ContactUsModelCopyWithImpl(
      _ContactUsModel _value, $Res Function(_ContactUsModel) _then)
      : super(_value, (v) => _then(v as _ContactUsModel));

  @override
  _ContactUsModel get _value => super._value as _ContactUsModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? topic = freezed,
    Object? message = freezed,
  }) {
    return _then(_ContactUsModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactUsModel extends _ContactUsModel {
  const _$_ContactUsModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.topic,
      required this.message})
      : super._();

  factory _$_ContactUsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContactUsModelFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  final String topic;
  @override
  final String message;

  @override
  String toString() {
    return 'ContactUsModel(uid: $uid, name: $name, email: $email, topic: $topic, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactUsModel &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.topic, topic) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(topic),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$ContactUsModelCopyWith<_ContactUsModel> get copyWith =>
      __$ContactUsModelCopyWithImpl<_ContactUsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactUsModelToJson(this);
  }
}

abstract class _ContactUsModel extends ContactUsModel {
  const factory _ContactUsModel(
      {required String uid,
      required String name,
      required String email,
      required String topic,
      required String message}) = _$_ContactUsModel;
  const _ContactUsModel._() : super._();

  factory _ContactUsModel.fromJson(Map<String, dynamic> json) =
      _$_ContactUsModel.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  String get topic;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$ContactUsModelCopyWith<_ContactUsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
