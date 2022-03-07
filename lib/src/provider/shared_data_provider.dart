import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:pig_care/src/model/pig_status.dart';
import 'package:pig_care/src/model/warning_config.dart';
import 'package:pig_care/src/util/common_const.dart';

import 'providers.dart';

const String _lowAlertLevelKey = 'low_alert_level_key';
const String _highAlertLevelKey = 'high_alert_level_key';
const String _showAsList = 'show_as_list';
const String _offsetKey = 'offset';

class SharedDataProvider {
  var delaySplash = 500;

  bool mayReload = false;

  SharedDataProvider._internal(this.rawSharedPreferences);

  static SharedDataProvider? _instance;

  bool get showAsList => _sharedPreferences.getBool(_showAsList) ?? true;
  set showAsList(bool value) => _sharedPreferences.setBool(_showAsList, value);
  static SharedDataProvider getInstance(
      Future<SharedPreferences> rawSharedPreferences) {
    return (_instance ??= SharedDataProvider._internal(rawSharedPreferences));
  }

  final selectedPig = ValueNotifier<PigStatus?>(null);
  final pigStatuses = ValueNotifier<List<PigStatus>>([]);
  final pigStatusHistories = ValueNotifier<List<PigStatus>>([]);
  final Future<SharedPreferences> rawSharedPreferences;
  late final SharedPreferences _sharedPreferences;
  late final isBeaconInitialized = ValueNotifier<bool?>(null);
  final isRanging = ValueNotifier(false);

  double get lowAlertLevel =>
      _sharedPreferences.getDouble(_lowAlertLevelKey) ?? 0.0;
  set lowAlertLevel(double value) =>
      _sharedPreferences.setDouble(_lowAlertLevelKey, value);

  double get highAlertLevel =>
      _sharedPreferences.getDouble(_highAlertLevelKey) ?? 37.0;
  set highAlertLevel(double value) =>
      _sharedPreferences.setDouble(_highAlertLevelKey, value);

  double get offset => _sharedPreferences.getDouble(_offsetKey) ?? 0.0;
  set offset(double value) => _sharedPreferences.setDouble(_offsetKey, value);

  Future<void> initialize() async {
    _sharedPreferences = await rawSharedPreferences;
  }

  WarningConfig? getConfigById({required String id}) {
    try {
      return WarningConfig.fromJson(
          json.decode(_sharedPreferences.getString(id) ?? ''));
    } catch (e) {
      print('$appKey $e');
      return null;
    }
  }

  void updatePigStatuses(
      List<Beacon> beacons, DateTime now, WarningConfig? commonConfig) {
    final newData = beacons.map((e) {
      final ps = PigStatus.fromBeacon(e, now, commonConfig);
      return ps.copyWith(temperature: ps.temperature + offset);
    });
    final map = <int, PigStatus>{};
    for (var element in newData) {
      map.putIfAbsent(element.id, () => element);
    }
    for (var element in pigStatuses.value) {
      map.putIfAbsent(
        element.id,
        () => element.copyWith(
          config: commonConfig ?? element.config,
          temperature: element.temperature,
        ),
      );
    }
    pigStatuses.value = map.values.toList()
      ..sort(
        (a, b) => (b.lastUpdate.millisecondsSinceEpoch
            .compareTo(a.lastUpdate.millisecondsSinceEpoch)),
      );
    pigStatusHistories.value = [...pigStatusHistories.value, ...newData]..sort(
        (a, b) => (b.lastUpdate.millisecondsSinceEpoch
            .compareTo(a.lastUpdate.millisecondsSinceEpoch)),
      );
  }
}
