import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_item_response.freezed.dart';

part 'district_item_response.g.dart';

@freezed
class DistrictItemResponse with _$DistrictItemResponse {
  const factory DistrictItemResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lon') double? lon,
    @JsonKey(name: 'region') required int region,
  }) = _DistrictItemResponse;

  factory DistrictItemResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictItemResponseFromJson(json);
}
