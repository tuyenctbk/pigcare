import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pig_care/l10n/l10n.dart';
import 'package:pig_care/src/provider/beacon_connection_manager.dart';
import 'package:pig_care/src/provider/shared_data_provider.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends VisibilityAwareState<SplashScreen> {
  late final BeaconConnectionManager _beaconConnectionManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _beaconConnectionManager =
        RepositoryProvider.of<BeaconConnectionManager>(context);
    RepositoryProvider.of<SharedDataProvider>(context).initialize();
  }

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    // TODO: implement onVisibilityChanged
    super.onVisibilityChanged(visibility);
    if (visibility == WidgetVisibility.VISIBLE) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _beaconConnectionManager.initialize();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sharedDataProvider =
        RepositoryProvider.of<SharedDataProvider>(context);

    return ValueListenableBuilder<bool?>(
        valueListenable: sharedDataProvider.isBeaconInitialized,
        builder: (context, value, _) {
          return Scaffold(
            body: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'assets/images/piggie/piggie.png',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ...value != false
                        ? [
                            const CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 40),
                            Text(L10n.current.initializing),
                          ]
                        : [
                            if (value == false)
                              TextButton(
                                  onPressed: () =>
                                      _beaconConnectionManager.initialize(),
                                  child: Text(
                                    L10n.current.retry,
                                    style: TextStyle(fontSize: 20),
                                  ))
                          ]
                  ],
                )),
          );
        });
  }
}
