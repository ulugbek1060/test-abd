import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/region_item_response.dart';

class RegionModel extends Equatable {
  final int? id;
  final String? name;
  final double? lat;
  final double? lon;
  final int? country;

  const RegionModel({this.id, this.name, this.lat, this.lon, this.country});

  static RegionModel fromResponse(RegionItemResponse region) {
    return RegionModel(
      id: region.id,
      name: region.name,
      lat: region.lat,
      lon: region.lon,
      country: region.country,
    );
  }

  // to json
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
    };
  }

  @override
  List<Object?> get props => [id, name, lat, lon, country];
}
