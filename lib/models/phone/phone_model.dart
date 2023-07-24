import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'phone_model.freezed.dart';
part 'phone_model.g.dart';

@Freezed()
abstract class PhoneModel implements _$PhoneModel {
  const PhoneModel._();

  const factory PhoneModel({
    required String model,
    required String imageUrl,
    required String soc,
    required int ram,
    required String storage,
    required double screenSize,
    required int battery,
    required String camera,
    required double price,
    required int stock,
    required double sar,
  }) = _PhoneModel;

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);

  factory PhoneModel.fromDocument(DocumentSnapshot document) {
    return PhoneModel.fromJson(document.data()! as Map<String, dynamic>);
  }

  Map<String, dynamic> toDocument() => toJson();
}
