// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
class _$CartModelTearOff {
  const _$CartModelTearOff();

  _CartModel call(
      {String? id, required String userId, required List<String> productIds}) {
    return _CartModel(
      id: id,
      userId: userId,
      productIds: productIds,
    );
  }

  CartModel fromJson(Map<String, Object?> json) {
    return CartModel.fromJson(json);
  }
}

/// @nodoc
const $CartModel = _$CartModelTearOff();

/// @nodoc
mixin _$CartModel {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<String> get productIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res>;
  $Res call({String? id, String userId, List<String> productIds});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res> implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  final CartModel _value;
  // ignore: unused_field
  final $Res Function(CartModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? productIds = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: productIds == freezed
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$CartModelCopyWith<$Res> implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(
          _CartModel value, $Res Function(_CartModel) then) =
      __$CartModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String userId, List<String> productIds});
}

/// @nodoc
class __$CartModelCopyWithImpl<$Res> extends _$CartModelCopyWithImpl<$Res>
    implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(_CartModel _value, $Res Function(_CartModel) _then)
      : super(_value, (v) => _then(v as _CartModel));

  @override
  _CartModel get _value => super._value as _CartModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? productIds = freezed,
  }) {
    return _then(_CartModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productIds: productIds == freezed
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartModel extends _CartModel {
  const _$_CartModel({this.id, required this.userId, required this.productIds})
      : super._();

  factory _$_CartModel.fromJson(Map<String, dynamic> json) =>
      _$$_CartModelFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final List<String> productIds;

  @override
  String toString() {
    return 'CartModel(id: $id, userId: $userId, productIds: $productIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.productIds, productIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(productIds));

  @JsonKey(ignore: true)
  @override
  _$CartModelCopyWith<_CartModel> get copyWith =>
      __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartModelToJson(this);
  }
}

abstract class _CartModel extends CartModel {
  const factory _CartModel(
      {String? id,
      required String userId,
      required List<String> productIds}) = _$_CartModel;
  const _CartModel._() : super._();

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$_CartModel.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  List<String> get productIds;
  @override
  @JsonKey(ignore: true)
  _$CartModelCopyWith<_CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}
