import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@Freezed()
abstract class OrderModel implements _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    String? id,
    required String userId,
    required List<String> productIds,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  factory OrderModel.fromDocument(DocumentSnapshot document) {
    final data = document.data()!;
    return OrderModel.fromJson(data as Map<String, dynamic>)
        .copyWith(id: document.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
