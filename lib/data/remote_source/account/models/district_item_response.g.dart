// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistrictItemResponseImpl _$$DistrictItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DistrictItemResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      region: (json['region'] as num).toInt(),
    );

Map<String, dynamic> _$$DistrictItemResponseImplToJson(
        _$DistrictItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'region': instance.region,
    };
