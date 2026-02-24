// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionItemResponseImpl _$$RegionItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegionItemResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: (json['country'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RegionItemResponseImplToJson(
        _$RegionItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
    };
