// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactUsModel _$$_ContactUsModelFromJson(Map<String, dynamic> json) =>
    _$_ContactUsModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      topic: json['topic'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_ContactUsModelToJson(_$_ContactUsModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'topic': instance.topic,
      'message': instance.message,
    };
