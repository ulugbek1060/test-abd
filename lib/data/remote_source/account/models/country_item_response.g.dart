// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryItemResponseImpl _$$CountryItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CountryItemResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$CountryItemResponseImplToJson(
        _$CountryItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'lat': instance.lat,
      'lon': instance.lon,
    };
