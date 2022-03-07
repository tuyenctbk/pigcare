import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pig_care/l10n/l10n.dart';
import 'package:pig_care/src/model/pig_status.dart';
import 'package:pig_care/src/navigation/router.dart';
import 'package:pig_care/src/provider/beacon_connection_manager.dart';
import 'package:pig_care/src/provider/shared_data_provider.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

import 'pig_detail_screen.dart';

class PigBoardScreen extends StatefulWidget {
  const PigBoardScreen({Key? key}) : super(key: key);

  @override
  State<PigBoardScreen> createState() => _PigBoardScreenState();
}

class _PigBoardScreenState extends VisibilityAwareState<PigBoardScreen> {

   late final platform = const MethodChannel('com.onesys.pigcare');

  late double _itemWidth;
  var _showAlarmOnly = false;
  late final SharedDataProvider _sharedDataProvider;
  late final BeaconConnectionManager _beaconConnectionManager;

  get _isRanging => _sharedDataProvider.isRanging.value;

  late final Timer _timer =
      Timer.periodic(const Duration(seconds: 3), (Timer t) async {
    final isBlueToothEnabled = await _isBlueToothEnable;

    final isLocationOn = await _checkDeviceLocationIsOn;
    if (!isBlueToothEnabled || !isLocationOn) {
      _sharedDataProvider.isBeaconInitialized.value = null;
      t.cancel();
    }
  });

  Future<bool> get _isBlueToothEnable async {
    return await FlutterBlue.instance.isOn;
  }

  Future<bool> get _checkDeviceLocationIsOn async {
    return await Permission.locationWhenInUse.serviceStatus.isEnabled;
  }

  @override
  void initState() {
    super.initState();
    _beaconConnectionManager =
        RepositoryProvider.of<BeaconConnectionManager>(context);
    _sharedDataProvider = RepositoryProvider.of<SharedDataProvider>(context);
  }

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    super.onVisibilityChanged(visibility);

    if (visibility == WidgetVisibility.INVISIBLE) {
      _sharedDataProvider.mayReload = true;
    } else if (visibility == WidgetVisibility.VISIBLE &&
        _sharedDataProvider.mayReload == true) {
      _sharedDataProvider.mayReload = false;
      _sharedDataProvider.isBeaconInitialized.value = null;
    }
    // if(visibility == WidgetVisibility.VISIBLE){
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
    _itemWidth = MediaQuery.of(context).size.width / 2 - 16;
    _beaconConnectionManager.startRanging();
    _timer;
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(warningConfig);
              },
              icon: const Icon(Icons.more_horiz))
        ],
        title: Text(L10n.current.appName),
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: _sharedDataProvider.isRanging,
        builder: (context, value, _) => Container(
          color: const Color(0xffdddddd),
          padding:
              const EdgeInsets.only(top: 3, left: 16, right: 16, bottom: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (value)
                    //   IconButton(
                    //       // style: ElevatedButton.styleFrom(
                    //       //     primary: value ? Colors.red : Colors.blue),
                    //       onPressed: () {
                    //         if (value) {
                    //           _beaconConnectionManager.stopRanging();
                    //         } else {
                    //           _beaconConnectionManager.startRanging();
                    //         }
                    //         _sharedDataProvider.isRanging.value = !value;
                    //         // setState(() {
                    //         //
                    //         // });
                    //       },
                    //       padding:const  EdgeInsets.all(6),
                    //       icon: Icon(
                    //         value ? Icons.stop : Icons.play_arrow,
                    //         color: value ? Colors.red : Colors.blue,
                    //         size: 40,
                    //       ))
                    // else
                    //   ElevatedButton(
                    //     style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8)),
                    //     onPressed: () {
                    //       if (value) {
                    //         _beaconConnectionManager.stopRanging();
                    //       } else {
                    //         _beaconConnectionManager.startRanging();
                    //       }
                    //       _sharedDataProvider.isRanging.value = !value;
                    //     },
                    //     child: Text(
                    //       value
                    //           ? L10n.current.stopObserve
                    //           : L10n.current.startObserve,
                    //       style: const TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white),
                    //     ),
                    //   ),
                    IconButton(
                      onPressed: () async {
                        // setState(() {
                        //   _showingAsListView = !_showingAsListView;
                        // });
                        _sharedDataProvider.mayReload = true;
                        await platform.invokeMethod('openThermalCamera');
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (setting) => ThermalPreviewScreen()));
                      },
                      icon: Image.asset(
                        'assets/images/ic_thermal.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  IconButton(
                      onPressed: () {
                        // setState(() {
                        //   _showingAsListView = !_showingAsListView;
                        // });
                      },
                      icon: Image.asset(
                        'assets/images/ic_temperature.png',
                        width: 24,
                        height: 24,
                      )),
                  const Spacer(),
                  // IconButton(onPressed: (){}, icon: ),
                  // SizedBox(width: 5,),
                  IconButton(
                    padding: const EdgeInsets.only(
                        left: 0, top: 8, right: 0, bottom: 8),
                    onPressed: () {
                      setState(() {
                        _sharedDataProvider.showAsList =
                            !_sharedDataProvider.showAsList;
                      });
                    },
                    icon: Icon(
                      !_sharedDataProvider.showAsList
                          ? Icons.grid_3x3_rounded
                          : Icons.list,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(
                        left: 0, top: 8, right: 0, bottom: 8),
                    onPressed: () {
                      setState(() {
                        _showAlarmOnly = !_showAlarmOnly;
                      });
                    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: !_showAlarmOnly ? Colors.blue : Colors.red,
                      size: 30,
                    ),
                  ),

                  // Text(_showAsListView
                  //     ? L10n.current.showAsGrid
                  //     : L10n.current.showAsList)
                ],
              ),
              const SizedBox(
                height: 5,
                width: double.infinity,
              ),
              if (_isRanging)
                Expanded(
                  child: ValueListenableBuilder<List<PigStatus>>(
                    valueListenable: _sharedDataProvider.pigStatuses,
                    builder: (context, pigStatuses, _) {
                      final filtered = pigStatuses
                          .where((element) =>
                              element.statusCode(
                                      lowAlertLevel:
                                          _sharedDataProvider.lowAlertLevel,
                                      highAlertLevel:
                                          _sharedDataProvider.highAlertLevel) ==
                                  StatusCode.alert ||
                              _showAlarmOnly == false)
                          .toList();

                      if (filtered.isEmpty) {
                        return Center(
                          child: Text(
                            !_showAlarmOnly
                                ? 'Không có thiết bị Beacon kết nối tới smartphone'
                                : 'Đang lọc chỉ hiển thị thân nhiệt bất thường. \n Không có thiết bị Beacon kết nối tới smartphone',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        );
                      }
                      return _sharedDataProvider.showAsList
                          ? ListView.separated(
                              itemBuilder: (context, idx) =>
                                  _buildPigStatusListItem(
                                    filtered[idx],
                                  ),
                              separatorBuilder: (context, idx) =>
                                  const SizedBox(
                                    height: 5,
                                  ),
                              itemCount: filtered.length)
                          : GridView.count(
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 4,
                              crossAxisCount: 2,
                              children: List.generate(
                                filtered.length,
                                (index) => _buildPigStatusGridItem(
                                  filtered[index],
                                ),
                              ),
                            );
                    },
                  ),
                )
              else
                Expanded(
                  child: Center(
                    child: Text(
                      L10n.current.notScanning,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  StatusCode _getStatusCode(
      {required double temperature,
      required double lowAlertLevel,
      required double highAlertLevel}) {
    if (temperature > lowAlertLevel && temperature < highAlertLevel) {
      return StatusCode.normal;
    } else {
      return StatusCode.alert;
    }
  }

  Widget _buildPigStatusGridItem(
    PigStatus pigStatus,
  ) =>
      InkWell(
        onTap: () => _openPigDetail(pigStatus.id),
        child: SizedBox(
          width: _itemWidth,
          height: 70,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
            child: Column(
              children: [
                Text(
                  L10n.current.id('${pigStatus.id}'),
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(L10n.current.temperature('${pigStatus.temperature}')),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/piggie/piggie.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const Spacer(),
                Text(pigStatus.getLastUpdateTime(now: DateTime.now())),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 10,
                color: getStatusColor(
                  _getStatusCode(
                      temperature: pigStatus.temperature,
                      highAlertLevel: _sharedDataProvider.highAlertLevel,
                      lowAlertLevel: _sharedDataProvider.lowAlertLevel),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildPigStatusListItem(
    PigStatus pigStatus,
  ) =>
      InkWell(
        onTap: () => _openPigDetail(pigStatus.id),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: getStatusColor(pigStatus.statusCode(
                      lowAlertLevel: _sharedDataProvider.lowAlertLevel,
                      highAlertLevel: _sharedDataProvider.highAlertLevel)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/piggie/piggie.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          L10n.current.id('${pigStatus.id}'),
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        // const Spacer(),
                        Text(
                          pigStatus.getLastUpdateTime(now: DateTime.now()),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      L10n.current.temperature('${pigStatus.temperature}'),
                      style: TextStyle(
                        color: getStatusColor(
                          pigStatus.statusCode(
                              highAlertLevel:
                                  _sharedDataProvider.highAlertLevel,
                              lowAlertLevel: _sharedDataProvider.lowAlertLevel),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void _openPigDetail(int id) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (setting) => PigDetailScreen(id: id)));
  }

  void dialogas() {}
}
