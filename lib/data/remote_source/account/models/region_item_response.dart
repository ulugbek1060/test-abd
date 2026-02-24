import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_item_response.freezed.dart';
part 'region_item_response.g.dart';

@freezed
class RegionItemResponse with _$RegionItemResponse {
  factory RegionItemResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lon') double? lon,
    @JsonKey(name: 'country') int? country,
  }) = _RegionItemResponse;

  factory RegionItemResponse.fromJson(Map<String, dynamic> json) =>
      _$RegionItemResponseFromJson(json);
}
