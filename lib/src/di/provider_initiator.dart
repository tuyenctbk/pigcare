import 'dart:io';

import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pig_care/src/provider/beacon_connection_manager.dart';

import '../provider/providers.dart';
import '../provider/shared_data_provider.dart';

class ProvidersInitiator {
  ProvidersInitiator._internal();

  static final ProvidersInitiator instance = ProvidersInitiator._internal();

  static late final _sharedPreferences = SharedPreferences.getInstance();

  static late final _sharedDataProvider =
      SharedDataProvider.getInstance(_sharedPreferences);

  List<RepositoryProvider<Object>> get repositoryProviders => [
        /// Shared Data Provider
        RepositoryProvider<SharedDataProvider>(
            create: (_) => _sharedDataProvider),

        RepositoryProvider<BeaconConnectionManager>(
          create: (_) => BeaconConnectionManager.getInstance(
              flutterBeacon, _sharedDataProvider),
        )
      ];
}
