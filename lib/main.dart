import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pig_care/src/di/provider_initiator.dart';

import 'l10n/l10n.dart';
import 'src/navigation/router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.microtask(() async {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent));

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    });

    return MultiRepositoryProvider(
      providers: ProvidersInitiator.instance.repositoryProviders,
      child: MaterialApp(
        // title: L10n.current.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: const Locale('vi', 'VN'),
        supportedLocales: L10n.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          L10n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        initialRoute: router.homeRoute,
        navigatorKey: router.navigatorKey,
        onGenerateRoute: router.Router().generateRoute,
      ),
    );
  }
}
