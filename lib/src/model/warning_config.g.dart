// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WarningConfig _$$_WarningConfigFromJson(Map<String, dynamic> json) =>
    _$_WarningConfig(
      alertLow: (json['alertLow'] as num?)?.toDouble() ?? defaultAlertLow,
      alertHigh: (json['alertHigh'] as num?)?.toDouble() ?? defaultAlertHigh,
    );

Map<String, dynamic> _$$_WarningConfigToJson(_$_WarningConfig instance) =>
    <String, dynamic>{
      'alertLow': instance.alertLow,
      'alertHigh': instance.alertHigh,
    };
