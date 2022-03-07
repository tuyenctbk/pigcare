import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pig_care/l10n/l10n.dart';
import 'package:pig_care/src/provider/shared_data_provider.dart';

class WarningSettingScreen extends StatefulWidget {
  const WarningSettingScreen({Key? key}) : super(key: key);

  @override
  State<WarningSettingScreen> createState() => _WarningSettingScreenState();
}

class _WarningSettingScreenState extends State<WarningSettingScreen> {
  late double alertLow = sharedDataProvider.lowAlertLevel;

  late double alertHigh = sharedDataProvider.highAlertLevel;

  late double offset = sharedDataProvider.offset;

  late final _dangerLowController = TextEditingController(text: '$alertLow');

  late final _dangerHighController = TextEditingController(text: '$alertHigh');

  late final _offsetController = TextEditingController(text: '$offset');

  late final isValid = ValueNotifier(true);

  late SharedDataProvider sharedDataProvider;

  void _updateIsValid() {
    isValid.value = alertLow < alertHigh;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =  TextStyle(fontSize: 17, color: Colors.black);
    sharedDataProvider = RepositoryProvider.of<SharedDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.current.warningLevelSetting),
      ),
      body: Container(
        height: double.infinity,
        color: const Color(0xffffffff),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                L10n.current.guideWarningInput,
                style: textStyle,
                softWrap: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    L10n.current.dangerLowAt,
                    style: textStyle.copyWith(color: Colors.red),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      style: textStyle.copyWith(color: Colors.red),
                      decoration: const InputDecoration(
                        suffixText: '°C',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      controller: _dangerLowController,
                      onChanged: (t) {
                        alertLow = double.tryParse(t) ?? -1;
                        _updateIsValid();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    L10n.current.dangerHighAt,
                    style: textStyle.copyWith(color: Colors.red),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      style: textStyle.copyWith(color: Colors.red),
                      decoration: const InputDecoration(
                        suffixText: '°C',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      controller: _dangerHighController,
                      onChanged: (t) {
                        alertHigh = double.tryParse(t) ?? -1;
                        _updateIsValid();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    L10n.current.deviceOffset,
                    style: textStyle,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      style: textStyle.copyWith(color: Colors.black),
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      decoration: const InputDecoration(
                        suffixText: '°C',
                      ),
                      controller: _offsetController,
                      onChanged: (t) {
                        offset = double.tryParse(t) ?? -1;
                        _updateIsValid();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10)),
                    onPressed: () {
                      sharedDataProvider.highAlertLevel = 37.0;
                      sharedDataProvider.lowAlertLevel = 0.0;
                      sharedDataProvider.offset = 0.0;
                      Navigator.of(context).pop();
                      sharedDataProvider.isBeaconInitialized.value = null;
                      // setState(() {
                      //   _dangerHighController.text = '$alertHigh';
                      //   _dangerLowController.text = '$alertLow';
                      // },);
                    },
                    child: Text(
                      L10n.current.reset,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                      valueListenable: isValid,
                      builder: (context, value, _) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                            ),
                            onPressed: (value)
                                ? () {
                                    sharedDataProvider.highAlertLevel =
                                        alertHigh;
                                    sharedDataProvider.lowAlertLevel = alertLow;
                                    sharedDataProvider.offset = offset;

                                    Navigator.of(context).pop();
                                    sharedDataProvider
                                        .isBeaconInitialized.value = null;
                                    // currentConfig.value = WarningConfig(
                                    //     alertLow: alertLow, alertHigh: alertHigh);
                                  }
                                : null,
                            child: Text(
                              L10n.current.save,
                              style: const TextStyle(fontSize: 20),
                            ));
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
