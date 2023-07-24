import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
abstract class UserModel implements _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String streetAddress,
    required int postalCode,
    required String city,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromDocument(DocumentSnapshot document) {
    return UserModel.fromJson(document.data()! as Map<String, dynamic>);
  }

  Map<String, dynamic> toDocument() => toJson();
}
