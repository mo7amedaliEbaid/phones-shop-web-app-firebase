import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@Freezed()
abstract class CartModel implements _$CartModel {
  const CartModel._();

  const factory CartModel({
    String? id,
    required String userId,
    required List<String> productIds,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  factory CartModel.fromDocument(DocumentSnapshot document) {
    final data = document.data()!;
    return CartModel.fromJson(data as Map<String, dynamic>)
        .copyWith(id: document.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
