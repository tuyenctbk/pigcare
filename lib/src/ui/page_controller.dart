import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pig_care/src/provider/shared_data_provider.dart';
import 'package:pig_care/src/ui/pig_board_screen.dart';
import 'package:pig_care/src/ui/splash_screen.dart';

class MyPageController extends StatelessWidget {
  const MyPageController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedDataProvider =
        RepositoryProvider.of<SharedDataProvider>(context);
    return ValueListenableBuilder<bool?>(
      valueListenable: sharedDataProvider.isBeaconInitialized,
      builder: (context, value, _) {
        if (value != true) {
          return SplashScreen();
        } else {
          return const PigBoardScreen();
        }
      },
    );
  }
}
