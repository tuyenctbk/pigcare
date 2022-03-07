// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pig_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PigStatus _$PigStatusFromJson(Map<String, dynamic> json) {
  return _PigStatus.fromJson(json);
}

/// @nodoc
class _$PigStatusTearOff {
  const _$PigStatusTearOff();

  _PigStatus call(
      {required int id,
      required double temperature,
      required DateTime lastUpdate,
      WarningConfig? config}) {
    return _PigStatus(
      id: id,
      temperature: temperature,
      lastUpdate: lastUpdate,
      config: config,
    );
  }

  PigStatus fromJson(Map<String, Object?> json) {
    return PigStatus.fromJson(json);
  }
}

/// @nodoc
const $PigStatus = _$PigStatusTearOff();

/// @nodoc
mixin _$PigStatus {
  int get id => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  WarningConfig? get config => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PigStatusCopyWith<PigStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PigStatusCopyWith<$Res> {
  factory $PigStatusCopyWith(PigStatus value, $Res Function(PigStatus) then) =
      _$PigStatusCopyWithImpl<$Res>;
  $Res call(
      {int id, double temperature, DateTime lastUpdate, WarningConfig? config});

  $WarningConfigCopyWith<$Res>? get config;
}

/// @nodoc
class _$PigStatusCopyWithImpl<$Res> implements $PigStatusCopyWith<$Res> {
  _$PigStatusCopyWithImpl(this._value, this._then);

  final PigStatus _value;
  // ignore: unused_field
  final $Res Function(PigStatus) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? temperature = freezed,
    Object? lastUpdate = freezed,
    Object? config = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as WarningConfig?,
    ));
  }

  @override
  $WarningConfigCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }

    return $WarningConfigCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
abstract class _$PigStatusCopyWith<$Res> implements $PigStatusCopyWith<$Res> {
  factory _$PigStatusCopyWith(
          _PigStatus value, $Res Function(_PigStatus) then) =
      __$PigStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, double temperature, DateTime lastUpdate, WarningConfig? config});

  @override
  $WarningConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$PigStatusCopyWithImpl<$Res> extends _$PigStatusCopyWithImpl<$Res>
    implements _$PigStatusCopyWith<$Res> {
  __$PigStatusCopyWithImpl(_PigStatus _value, $Res Function(_PigStatus) _then)
      : super(_value, (v) => _then(v as _PigStatus));

  @override
  _PigStatus get _value => super._value as _PigStatus;

  @override
  $Res call({
    Object? id = freezed,
    Object? temperature = freezed,
    Object? lastUpdate = freezed,
    Object? config = freezed,
  }) {
    return _then(_PigStatus(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as WarningConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PigStatus extends _PigStatus {
  const _$_PigStatus(
      {required this.id,
      required this.temperature,
      required this.lastUpdate,
      this.config})
      : super._();

  factory _$_PigStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PigStatusFromJson(json);

  @override
  final int id;
  @override
  final double temperature;
  @override
  final DateTime lastUpdate;
  @override
  final WarningConfig? config;

  @override
  String toString() {
    return 'PigStatus(id: $id, temperature: $temperature, lastUpdate: $lastUpdate, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PigStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, temperature, lastUpdate, config);

  @JsonKey(ignore: true)
  @override
  _$PigStatusCopyWith<_PigStatus> get copyWith =>
      __$PigStatusCopyWithImpl<_PigStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PigStatusToJson(this);
  }
}

abstract class _PigStatus extends PigStatus {
  const factory _PigStatus(
      {required int id,
      required double temperature,
      required DateTime lastUpdate,
      WarningConfig? config}) = _$_PigStatus;
  const _PigStatus._() : super._();

  factory _PigStatus.fromJson(Map<String, dynamic> json) =
      _$_PigStatus.fromJson;

  @override
  int get id;
  @override
  double get temperature;
  @override
  DateTime get lastUpdate;
  @override
  WarningConfig? get config;
  @override
  @JsonKey(ignore: true)
  _$PigStatusCopyWith<_PigStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
