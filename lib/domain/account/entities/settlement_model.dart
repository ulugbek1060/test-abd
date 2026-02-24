import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/settlement_item_response.dart';

class SettlementModel extends Equatable {
  final int? id;
  final String? name;
  final double? lat;
  final double? lon;
  final int? district;

  const SettlementModel({
    this.id,
    this.name,
    this.lat,
    this.lon,
    this.district,
  });

  static SettlementModel fromResponse(SettlementItemResponse response) {
    return SettlementModel(
      id: response.id,
      name: response.name,
      lat: response.lat,
      lon: response.lon,
      district: response.district,
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lat': lat,
    'lon': lon,
    'district': district,
  };

  @override
  List<Object?> get props => [id, name, lat, lon, district];
}
