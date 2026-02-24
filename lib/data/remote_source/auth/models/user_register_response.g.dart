// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterResponseImpl _$$UserRegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String,
      email: json['email'] as String?,
      password: json['password'] as String,
      token: json['token'] as String?,
      referralCode: json['referral_code'] as String?,
    );

Map<String, dynamic> _$$UserRegisterResponseImplToJson(
        _$UserRegisterResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'referral_code': instance.referralCode,
    };
