import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'contact_us_model.freezed.dart';
part 'contact_us_model.g.dart';

@Freezed()
abstract class ContactUsModel implements _$ContactUsModel {
  const ContactUsModel._();

  const factory ContactUsModel({
    required String uid,
    required String name,
    required String email,
    required String topic,
    required String message,
  }) = _ContactUsModel;

  factory ContactUsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);

  factory ContactUsModel.fromDocument(DocumentSnapshot document) {
    return ContactUsModel.fromJson(document.data()! as Map<String, dynamic>);
  }

  Map<String, dynamic> toDocument() => toJson();
}

