import 'dart:ui';

import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pig_care/src/model/warning_config.dart';
import 'package:pig_care/src/util/shared_colors.dart';

part 'pig_status.freezed.dart';
part 'pig_status.g.dart';

@freezed
class PigStatus with _$PigStatus {
  const PigStatus._();

  const factory PigStatus({
    required int id,
    required double temperature,
    required DateTime lastUpdate,
    WarningConfig? config,
  }) = _PigStatus;

  factory PigStatus.fromJson(Map<String, dynamic> json) =>
      _$PigStatusFromJson(json);

  factory PigStatus.fromBeacon(
      Beacon beacon, DateTime now, WarningConfig? warningConfig) {
    return PigStatus(
        id: beacon.major,
        temperature: beacon.minor / 10,
        lastUpdate: now,
        config: warningConfig);
  }

  StatusCode? statusCode(
      {required double lowAlertLevel, required double highAlertLevel}) {
    return (temperature < lowAlertLevel || temperature > highAlertLevel)
        ? StatusCode.alert
        : StatusCode.normal;
  }

  String getLastUpdateTime({required DateTime now, bool detail: false}) {
    int dayDif = now.difference(lastUpdate).inDays;
    int year = lastUpdate.year;
    int month = lastUpdate.month;
    int day = lastUpdate.day;
    String atDate =
        '${day > 9 ? day : '0$day'}/${month > 9 ? month : '0$month'}/$year}';
    // int minAgo = now.difference(lastUpdate).inMinutes;
    int min = lastUpdate.minute;
    int hour = lastUpdate.hour;
    int second = lastUpdate.second;

    String atTime = '${hour > 9 ? hour : '0$hour'}:${min > 9 ? min : '$min'}:${second > 9 ? second:'0$second'}';
    // if(day ==1 ){
    //   return L10n.current.yesterday;
    // }
    // else
    if (dayDif >= 1) {
      return atDate;
    } else {
      // if (minAgo <60){
      //   return L10n.current.minAgo('$minAgo');
      // }
      // else {
      return atTime;
      // }
    }
  }
}

Color getStatusColor(StatusCode? code) {
  switch (code) {
    case StatusCode.unknown:
      return SharedColor.disabledColor;
    case StatusCode.normal:
      return SharedColor.normalColor;
    case StatusCode.alert:
      return SharedColor.alertColor;
    default:
      return SharedColor.disabledColor;
  }
}

enum StatusCode {
  normal,
  alert,
  unknown,
}
