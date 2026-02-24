import 'package:freezed_annotation/freezed_annotation.dart';

part 'settlement_item_response.freezed.dart';
part 'settlement_item_response.g.dart';

@freezed
class SettlementItemResponse with _$SettlementItemResponse {

  const factory SettlementItemResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'lat') required double? lat,
    @JsonKey(name: 'lon') required double? lon,
    @JsonKey(name: 'district') required int district,
  }) = _SettlementItemResponse;

  factory SettlementItemResponse.fromJson(Map<String, dynamic> json) =>
      _$SettlementItemResponseFromJson(json);
}
