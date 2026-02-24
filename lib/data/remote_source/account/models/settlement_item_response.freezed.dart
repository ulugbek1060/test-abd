// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settlement_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettlementItemResponse _$SettlementItemResponseFromJson(
    Map<String, dynamic> json) {
  return _SettlementItemResponse.fromJson(json);
}

/// @nodoc
mixin _$SettlementItemResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  int get district => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettlementItemResponseCopyWith<SettlementItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettlementItemResponseCopyWith<$Res> {
  factory $SettlementItemResponseCopyWith(SettlementItemResponse value,
          $Res Function(SettlementItemResponse) then) =
      _$SettlementItemResponseCopyWithImpl<$Res, SettlementItemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'district') int district});
}

/// @nodoc
class _$SettlementItemResponseCopyWithImpl<$Res,
        $Val extends SettlementItemResponse>
    implements $SettlementItemResponseCopyWith<$Res> {
  _$SettlementItemResponseCopyWithImpl(this._value, this._then);

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
    Object? district = null,
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
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettlementItemResponseImplCopyWith<$Res>
    implements $SettlementItemResponseCopyWith<$Res> {
  factory _$$SettlementItemResponseImplCopyWith(
          _$SettlementItemResponseImpl value,
          $Res Function(_$SettlementItemResponseImpl) then) =
      __$$SettlementItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'district') int district});
}

/// @nodoc
class __$$SettlementItemResponseImplCopyWithImpl<$Res>
    extends _$SettlementItemResponseCopyWithImpl<$Res,
        _$SettlementItemResponseImpl>
    implements _$$SettlementItemResponseImplCopyWith<$Res> {
  __$$SettlementItemResponseImplCopyWithImpl(
      _$SettlementItemResponseImpl _value,
      $Res Function(_$SettlementItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? district = null,
  }) {
    return _then(_$SettlementItemResponseImpl(
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
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettlementItemResponseImpl implements _SettlementItemResponse {
  const _$SettlementItemResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'lat') required this.lat,
      @JsonKey(name: 'lon') required this.lon,
      @JsonKey(name: 'district') required this.district});

  factory _$SettlementItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettlementItemResponseImplFromJson(json);

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
  @JsonKey(name: 'district')
  final int district;

  @override
  String toString() {
    return 'SettlementItemResponse(id: $id, name: $name, lat: $lat, lon: $lon, district: $district)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettlementItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.district, district) ||
                other.district == district));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lat, lon, district);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettlementItemResponseImplCopyWith<_$SettlementItemResponseImpl>
      get copyWith => __$$SettlementItemResponseImplCopyWithImpl<
          _$SettlementItemResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettlementItemResponseImplToJson(
      this,
    );
  }
}

abstract class _SettlementItemResponse implements SettlementItemResponse {
  const factory _SettlementItemResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'lat') required final double? lat,
          @JsonKey(name: 'lon') required final double? lon,
          @JsonKey(name: 'district') required final int district}) =
      _$SettlementItemResponseImpl;

  factory _SettlementItemResponse.fromJson(Map<String, dynamic> json) =
      _$SettlementItemResponseImpl.fromJson;

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
  @JsonKey(name: 'district')
  int get district;
  @override
  @JsonKey(ignore: true)
  _$$SettlementItemResponseImplCopyWith<_$SettlementItemResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
