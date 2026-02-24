import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_item_response.freezed.dart';
part 'country_item_response.g.dart';

@freezed
class CountryItemResponse with _$CountryItemResponse {
  const factory CountryItemResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'lon') required double lon,
  }) = _CountryItemResponse;

  factory CountryItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryItemResponseFromJson(json);
}
