import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/country_item_response.dart';

class CountryModel with EquatableMixin {
  final int? id;
  final String? name;
  final String? code;
  final double? lat;
  final double? lon;

  CountryModel({this.id, this.name, this.code, this.lat, this.lon});

  // from response
  static CountryModel fromResponse(CountryItemResponse country) {
    return CountryModel(
      id: country.id,
      name: country.name,
      code: country.code,
      lat: country.lat,
      lon: country.lon,
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'code': code,
    'lat': lat,
    'lon': lon,
  };

  @override
  List<Object?> get props => [id, name, code, lat, lon];
}
