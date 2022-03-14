import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:pig_care/src/model/warning_config.dart';
import 'package:pig_care/src/provider/shared_data_provider.dart';

class BeaconConnectionManager {
  late StreamSubscription<RangingResult> _streamRanging;

  late StreamSubscription<MonitoringResult> _streamMonitoring;

  bool usingMockData = false;

  BeaconConnectionManager._internal(
      this.flutterBeacon, this.sharedDataProvider);

  final FlutterBeacon flutterBeacon;
  final SharedDataProvider sharedDataProvider;

  static BeaconConnectionManager? _instance;
  static BeaconConnectionManager getInstance(
      FlutterBeacon flutterBeacon, SharedDataProvider sharedDataProvider) {
    _instance ??=
        BeaconConnectionManager._internal(flutterBeacon, sharedDataProvider);
    return _instance!;
  }

  Future<void> initialize() async {
    try {
      // if you want to manavar ual checking about the required permissions
      await flutterBeacon.initializeScanning;

      // or if you want to include automatic checking permission
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (_) {
      // library failed to initialize, check code and message
      sharedDataProvider.isBeaconInitialized.value = false;
    }
    sharedDataProvider.isBeaconInitialized.value = true;
  }

  final regions = <Region>[];
  void startRanging() {
    if (Platform.isIOS) {
      // iOS platform, at least set identifier and proximityUUID for region scanning
      regions.add(Region(
          identifier: 'Apple Airlocate',
          proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
      // Region(identifier: 'com.beacon', proximityUUID:'01122334-4556-6778-899A-ABBCCDDEEFF0'),
    } else {
      // android platform, it can ranging out of beacon that filter all of Proximity UUID
      if (regions.isEmpty) {
        regions.add(
          Region(
              identifier: 'com.beacon',
              proximityUUID: '01122334-4556-6778-899A-ABBCCDDEEFF0'),
        );
      }
    }

    if (usingMockData) {
      sharedDataProvider.pigStatusHistories.value = [];
      sharedDataProvider.pigStatuses.value = [];
// to start ranging beacons
      sharedDataProvider.updatePigStatuses(
          [
            const Beacon(
              proximityUUID: '',
              major: 1300,
              minor: 360,
              accuracy: 0.1,
            ),
            const Beacon(
                proximityUUID: '', major: 1301, minor: 340, accuracy: 0.1),
            const Beacon(
                proximityUUID: '', major: 1304, minor: 370, accuracy: 0.1),
            const Beacon(
                proximityUUID: '', major: 1302, minor: 350, accuracy: 0.1),
            const Beacon(
                proximityUUID: '', major: 1305, minor: 300, accuracy: 0.1),
            const Beacon(
                proximityUUID: '', major: 1303, minor: 360, accuracy: 0.1),
            // const Beacon(
            //   proximityUUID: '',
            //   major: 13001,
            //   minor: 420,
            //   accuracy: 0.1,
            // ),
            // const Beacon(
            //     proximityUUID: '', major: 13011, minor: 340, accuracy: 0.1),
            // const Beacon(
            //     proximityUUID: '', major: 13015, minor: 380, accuracy: 0.1),
            // const Beacon(
            //     proximityUUID: '', major: 13010, minor: 390, accuracy: 0.1),
            // const Beacon(
            //     proximityUUID: '', major: 13012, minor: 350, accuracy: 0.1),
            // const Beacon(
            //     proximityUUID: '', major: 13013, minor: 360, accuracy: 0.1),
            // const Beacon(
            //     proximityUUID: '', major: 13014, minor: 370, accuracy: 0.1),
            // const Beacon(
            //     proximityUUID: '', major: 13010, minor: 400, accuracy: 0.1),
          ],
          DateTime.now(),
          WarningConfig(
              alertLow: sharedDataProvider.lowAlertLevel,
              alertHigh: sharedDataProvider.highAlertLevel));
    }

    sharedDataProvider.isRanging.value = true;
    flutterBeacon.setBetweenScanPeriod(400);
    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) {
      if (result.beacons.isNotEmpty) {
        sharedDataProvider.updatePigStatuses(
          result.beacons
              .where((element) =>
                  element.proximityUUID ==
                  '01122334-4556-6778-899A-ABBCCDDEEFF0')
              .toList(),
          DateTime.now(),
          WarningConfig(
              alertHigh: sharedDataProvider.highAlertLevel,
              alertLow: sharedDataProvider.lowAlertLevel),
        );
      }
    });
  }

  void stopRanging() {
    _streamRanging.cancel();
    sharedDataProvider.isRanging.value = false;
  }

  void startMonitor() {
    if (Platform.isIOS) {
      // iOS platform, at least set identifier and proximityUUID for region scanning
      regions.add(Region(
          identifier: 'Apple Airlocate',
          proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
    } else {
      // Android platform, it can ranging out of beacon that filter all of Proximity UUID
      regions.add(Region(identifier: 'com.beacon'));
    }

// to start monitoring beacons
    _streamMonitoring =
        flutterBeacon.monitoring(regions).listen((MonitoringResult result) {
      // result contains a region, event type and event state
      result.monitoringEventType;
    });
  }

  void stopMonitor() {
    // to stop monitoring beacons
    _streamMonitoring.cancel();
  }
}
