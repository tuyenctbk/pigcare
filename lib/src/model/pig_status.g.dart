// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pig_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PigStatus _$$_PigStatusFromJson(Map<String, dynamic> json) => _$_PigStatus(
      id: json['id'] as int,
      temperature: (json['temperature'] as num).toDouble(),
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      config: json['config'] == null
          ? null
          : WarningConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PigStatusToJson(_$_PigStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'config': instance.config,
    };
