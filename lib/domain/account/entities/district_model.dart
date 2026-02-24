import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/district_item_response.dart';

class DistrictModel extends Equatable {
  final int? id;
  final String? name;
  final double? lat;
  final double? lon;
  final int? region;

  const DistrictModel({
     this.id,
     this.name,
     this.lat,
     this.lon,
     this.region,
  });

  static DistrictModel fromResponse(DistrictItemResponse response) {
    return DistrictModel(
      id: response.id,
      name: response.name,
      lat: response.lat,
      lon: response.lon,
      region: response.region,
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lat': lat,
    'lon': lon,
    'region': region,
  };

  @override
  List<Object?> get props => [id, name, lat, lon, region];
}
