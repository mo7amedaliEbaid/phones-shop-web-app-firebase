// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneModel _$$_PhoneModelFromJson(Map<String, dynamic> json) =>
    _$_PhoneModel(
      model: json['model'] as String,
      imageUrl: json['imageUrl'] as String,
      soc: json['soc'] as String,
      ram: json['ram'] as int,
      storage: json['storage'] as String,
      screenSize: (json['screenSize'] as num).toDouble(),
      battery: json['battery'] as int,
      camera: json['camera'] as String,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      sar: (json['sar'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PhoneModelToJson(_$_PhoneModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'imageUrl': instance.imageUrl,
      'soc': instance.soc,
      'ram': instance.ram,
      'storage': instance.storage,
      'screenSize': instance.screenSize,
      'battery': instance.battery,
      'camera': instance.camera,
      'price': instance.price,
      'stock': instance.stock,
      'sar': instance.sar,
    };
