// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlement_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettlementItemResponseImpl _$$SettlementItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SettlementItemResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      district: (json['district'] as num).toInt(),
    );

Map<String, dynamic> _$$SettlementItemResponseImplToJson(
        _$SettlementItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'district': instance.district,
    };
