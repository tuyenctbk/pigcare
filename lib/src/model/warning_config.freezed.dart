// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'warning_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WarningConfig _$WarningConfigFromJson(Map<String, dynamic> json) {
  return _WarningConfig.fromJson(json);
}

/// @nodoc
class _$WarningConfigTearOff {
  const _$WarningConfigTearOff();

  _WarningConfig call(
      {@JsonKey(name: 'alertLow', nullable: true)
          double alertLow = defaultAlertLow,
      @JsonKey(name: 'alertHigh', nullable: true)
          double alertHigh = defaultAlertHigh}) {
    return _WarningConfig(
      alertLow: alertLow,
      alertHigh: alertHigh,
    );
  }

  WarningConfig fromJson(Map<String, Object?> json) {
    return WarningConfig.fromJson(json);
  }
}

/// @nodoc
const $WarningConfig = _$WarningConfigTearOff();

/// @nodoc
mixin _$WarningConfig {
  @JsonKey(name: 'alertLow', nullable: true)
  double get alertLow => throw _privateConstructorUsedError;
  @JsonKey(name: 'alertHigh', nullable: true)
  double get alertHigh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WarningConfigCopyWith<WarningConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarningConfigCopyWith<$Res> {
  factory $WarningConfigCopyWith(
          WarningConfig value, $Res Function(WarningConfig) then) =
      _$WarningConfigCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'alertLow', nullable: true) double alertLow,
      @JsonKey(name: 'alertHigh', nullable: true) double alertHigh});
}

/// @nodoc
class _$WarningConfigCopyWithImpl<$Res>
    implements $WarningConfigCopyWith<$Res> {
  _$WarningConfigCopyWithImpl(this._value, this._then);

  final WarningConfig _value;
  // ignore: unused_field
  final $Res Function(WarningConfig) _then;

  @override
  $Res call({
    Object? alertLow = freezed,
    Object? alertHigh = freezed,
  }) {
    return _then(_value.copyWith(
      alertLow: alertLow == freezed
          ? _value.alertLow
          : alertLow // ignore: cast_nullable_to_non_nullable
              as double,
      alertHigh: alertHigh == freezed
          ? _value.alertHigh
          : alertHigh // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$WarningConfigCopyWith<$Res>
    implements $WarningConfigCopyWith<$Res> {
  factory _$WarningConfigCopyWith(
          _WarningConfig value, $Res Function(_WarningConfig) then) =
      __$WarningConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'alertLow', nullable: true) double alertLow,
      @JsonKey(name: 'alertHigh', nullable: true) double alertHigh});
}

/// @nodoc
class __$WarningConfigCopyWithImpl<$Res>
    extends _$WarningConfigCopyWithImpl<$Res>
    implements _$WarningConfigCopyWith<$Res> {
  __$WarningConfigCopyWithImpl(
      _WarningConfig _value, $Res Function(_WarningConfig) _then)
      : super(_value, (v) => _then(v as _WarningConfig));

  @override
  _WarningConfig get _value => super._value as _WarningConfig;

  @override
  $Res call({
    Object? alertLow = freezed,
    Object? alertHigh = freezed,
  }) {
    return _then(_WarningConfig(
      alertLow: alertLow == freezed
          ? _value.alertLow
          : alertLow // ignore: cast_nullable_to_non_nullable
              as double,
      alertHigh: alertHigh == freezed
          ? _value.alertHigh
          : alertHigh // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WarningConfig extends _WarningConfig {
  const _$_WarningConfig(
      {@JsonKey(name: 'alertLow', nullable: true)
          this.alertLow = defaultAlertLow,
      @JsonKey(name: 'alertHigh', nullable: true)
          this.alertHigh = defaultAlertHigh})
      : super._();

  factory _$_WarningConfig.fromJson(Map<String, dynamic> json) =>
      _$$_WarningConfigFromJson(json);

  @override
  @JsonKey(name: 'alertLow', nullable: true)
  final double alertLow;
  @override
  @JsonKey(name: 'alertHigh', nullable: true)
  final double alertHigh;

  @override
  String toString() {
    return 'WarningConfig(alertLow: $alertLow, alertHigh: $alertHigh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WarningConfig &&
            (identical(other.alertLow, alertLow) ||
                other.alertLow == alertLow) &&
            (identical(other.alertHigh, alertHigh) ||
                other.alertHigh == alertHigh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alertLow, alertHigh);

  @JsonKey(ignore: true)
  @override
  _$WarningConfigCopyWith<_WarningConfig> get copyWith =>
      __$WarningConfigCopyWithImpl<_WarningConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WarningConfigToJson(this);
  }
}

abstract class _WarningConfig extends WarningConfig {
  const factory _WarningConfig(
          {@JsonKey(name: 'alertLow', nullable: true) double alertLow,
          @JsonKey(name: 'alertHigh', nullable: true) double alertHigh}) =
      _$_WarningConfig;
  const _WarningConfig._() : super._();

  factory _WarningConfig.fromJson(Map<String, dynamic> json) =
      _$_WarningConfig.fromJson;

  @override
  @JsonKey(name: 'alertLow', nullable: true)
  double get alertLow;
  @override
  @JsonKey(name: 'alertHigh', nullable: true)
  double get alertHigh;
  @override
  @JsonKey(ignore: true)
  _$WarningConfigCopyWith<_WarningConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
