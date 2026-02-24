// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegionItemResponse _$RegionItemResponseFromJson(Map<String, dynamic> json) {
  return _RegionItemResponse.fromJson(json);
}

/// @nodoc
mixin _$RegionItemResponse {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  int? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionItemResponseCopyWith<RegionItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionItemResponseCopyWith<$Res> {
  factory $RegionItemResponseCopyWith(
          RegionItemResponse value, $Res Function(RegionItemResponse) then) =
      _$RegionItemResponseCopyWithImpl<$Res, RegionItemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'country') int? country});
}

/// @nodoc
class _$RegionItemResponseCopyWithImpl<$Res, $Val extends RegionItemResponse>
    implements $RegionItemResponseCopyWith<$Res> {
  _$RegionItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionItemResponseImplCopyWith<$Res>
    implements $RegionItemResponseCopyWith<$Res> {
  factory _$$RegionItemResponseImplCopyWith(_$RegionItemResponseImpl value,
          $Res Function(_$RegionItemResponseImpl) then) =
      __$$RegionItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'country') int? country});
}

/// @nodoc
class __$$RegionItemResponseImplCopyWithImpl<$Res>
    extends _$RegionItemResponseCopyWithImpl<$Res, _$RegionItemResponseImpl>
    implements _$$RegionItemResponseImplCopyWith<$Res> {
  __$$RegionItemResponseImplCopyWithImpl(_$RegionItemResponseImpl _value,
      $Res Function(_$RegionItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? country = freezed,
  }) {
    return _then(_$RegionItemResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionItemResponseImpl implements _RegionItemResponse {
  _$RegionItemResponseImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'lat') this.lat,
      @JsonKey(name: 'lon') this.lon,
      @JsonKey(name: 'country') this.country});

  factory _$RegionItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionItemResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'lat')
  final double? lat;
  @override
  @JsonKey(name: 'lon')
  final double? lon;
  @override
  @JsonKey(name: 'country')
  final int? country;

  @override
  String toString() {
    return 'RegionItemResponse(id: $id, name: $name, lat: $lat, lon: $lon, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lat, lon, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionItemResponseImplCopyWith<_$RegionItemResponseImpl> get copyWith =>
      __$$RegionItemResponseImplCopyWithImpl<_$RegionItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionItemResponseImplToJson(
      this,
    );
  }
}

abstract class _RegionItemResponse implements RegionItemResponse {
  factory _RegionItemResponse(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'lat') final double? lat,
      @JsonKey(name: 'lon') final double? lon,
      @JsonKey(name: 'country') final int? country}) = _$RegionItemResponseImpl;

  factory _RegionItemResponse.fromJson(Map<String, dynamic> json) =
      _$RegionItemResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'lat')
  double? get lat;
  @override
  @JsonKey(name: 'lon')
  double? get lon;
  @override
  @JsonKey(name: 'country')
  int? get country;
  @override
  @JsonKey(ignore: true)
  _$$RegionItemResponseImplCopyWith<_$RegionItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
