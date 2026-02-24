// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DistrictItemResponse _$DistrictItemResponseFromJson(Map<String, dynamic> json) {
  return _DistrictItemResponse.fromJson(json);
}

/// @nodoc
mixin _$DistrictItemResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'region')
  int get region => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictItemResponseCopyWith<DistrictItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictItemResponseCopyWith<$Res> {
  factory $DistrictItemResponseCopyWith(DistrictItemResponse value,
          $Res Function(DistrictItemResponse) then) =
      _$DistrictItemResponseCopyWithImpl<$Res, DistrictItemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'region') int region});
}

/// @nodoc
class _$DistrictItemResponseCopyWithImpl<$Res,
        $Val extends DistrictItemResponse>
    implements $DistrictItemResponseCopyWith<$Res> {
  _$DistrictItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? region = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictItemResponseImplCopyWith<$Res>
    implements $DistrictItemResponseCopyWith<$Res> {
  factory _$$DistrictItemResponseImplCopyWith(_$DistrictItemResponseImpl value,
          $Res Function(_$DistrictItemResponseImpl) then) =
      __$$DistrictItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'region') int region});
}

/// @nodoc
class __$$DistrictItemResponseImplCopyWithImpl<$Res>
    extends _$DistrictItemResponseCopyWithImpl<$Res, _$DistrictItemResponseImpl>
    implements _$$DistrictItemResponseImplCopyWith<$Res> {
  __$$DistrictItemResponseImplCopyWithImpl(_$DistrictItemResponseImpl _value,
      $Res Function(_$DistrictItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? region = null,
  }) {
    return _then(_$DistrictItemResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictItemResponseImpl implements _DistrictItemResponse {
  const _$DistrictItemResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'lat') this.lat,
      @JsonKey(name: 'lon') this.lon,
      @JsonKey(name: 'region') required this.region});

  factory _$DistrictItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictItemResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'lat')
  final double? lat;
  @override
  @JsonKey(name: 'lon')
  final double? lon;
  @override
  @JsonKey(name: 'region')
  final int region;

  @override
  String toString() {
    return 'DistrictItemResponse(id: $id, name: $name, lat: $lat, lon: $lon, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lat, lon, region);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictItemResponseImplCopyWith<_$DistrictItemResponseImpl>
      get copyWith =>
          __$$DistrictItemResponseImplCopyWithImpl<_$DistrictItemResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictItemResponseImplToJson(
      this,
    );
  }
}

abstract class _DistrictItemResponse implements DistrictItemResponse {
  const factory _DistrictItemResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'lat') final double? lat,
          @JsonKey(name: 'lon') final double? lon,
          @JsonKey(name: 'region') required final int region}) =
      _$DistrictItemResponseImpl;

  factory _DistrictItemResponse.fromJson(Map<String, dynamic> json) =
      _$DistrictItemResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'lat')
  double? get lat;
  @override
  @JsonKey(name: 'lon')
  double? get lon;
  @override
  @JsonKey(name: 'region')
  int get region;
  @override
  @JsonKey(ignore: true)
  _$$DistrictItemResponseImplCopyWith<_$DistrictItemResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
