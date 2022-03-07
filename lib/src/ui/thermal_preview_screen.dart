import 'package:flutter/material.dart';
import 'package:pig_care/src/navigation/router.dart';

class ThermalPreviewScreen extends StatelessWidget {
  const ThermalPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // if(Navigator.canPop(context))
        Navigator.of(context).pushReplacementNamed(homeRoute);
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset('assets/images/dummy_camera.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
