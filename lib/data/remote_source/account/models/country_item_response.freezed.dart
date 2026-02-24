// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryItemResponse _$CountryItemResponseFromJson(Map<String, dynamic> json) {
  return _CountryItemResponse.fromJson(json);
}

/// @nodoc
mixin _$CountryItemResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryItemResponseCopyWith<CountryItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryItemResponseCopyWith<$Res> {
  factory $CountryItemResponseCopyWith(
          CountryItemResponse value, $Res Function(CountryItemResponse) then) =
      _$CountryItemResponseCopyWithImpl<$Res, CountryItemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'lat') double lat,
      @JsonKey(name: 'lon') double lon});
}

/// @nodoc
class _$CountryItemResponseCopyWithImpl<$Res, $Val extends CountryItemResponse>
    implements $CountryItemResponseCopyWith<$Res> {
  _$CountryItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? lat = null,
    Object? lon = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryItemResponseImplCopyWith<$Res>
    implements $CountryItemResponseCopyWith<$Res> {
  factory _$$CountryItemResponseImplCopyWith(_$CountryItemResponseImpl value,
          $Res Function(_$CountryItemResponseImpl) then) =
      __$$CountryItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'lat') double lat,
      @JsonKey(name: 'lon') double lon});
}

/// @nodoc
class __$$CountryItemResponseImplCopyWithImpl<$Res>
    extends _$CountryItemResponseCopyWithImpl<$Res, _$CountryItemResponseImpl>
    implements _$$CountryItemResponseImplCopyWith<$Res> {
  __$$CountryItemResponseImplCopyWithImpl(_$CountryItemResponseImpl _value,
      $Res Function(_$CountryItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$CountryItemResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryItemResponseImpl implements _CountryItemResponse {
  const _$CountryItemResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'lat') required this.lat,
      @JsonKey(name: 'lon') required this.lon});

  factory _$CountryItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryItemResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'lat')
  final double lat;
  @override
  @JsonKey(name: 'lon')
  final double lon;

  @override
  String toString() {
    return 'CountryItemResponse(id: $id, name: $name, code: $code, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryItemResponseImplCopyWith<_$CountryItemResponseImpl> get copyWith =>
      __$$CountryItemResponseImplCopyWithImpl<_$CountryItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryItemResponseImplToJson(
      this,
    );
  }
}

abstract class _CountryItemResponse implements CountryItemResponse {
  const factory _CountryItemResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'code') required final String code,
          @JsonKey(name: 'lat') required final double lat,
          @JsonKey(name: 'lon') required final double lon}) =
      _$CountryItemResponseImpl;

  factory _CountryItemResponse.fromJson(Map<String, dynamic> json) =
      _$CountryItemResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'lat')
  double get lat;
  @override
  @JsonKey(name: 'lon')
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$CountryItemResponseImplCopyWith<_$CountryItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
