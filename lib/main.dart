import 'package:flutter/material.dart';

import 'balloon_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MaterialApp(
        home: Scaffold(
          body: Center(
              child: Container(
            child: Center(
              child: new BalloonSlider(),
            ),
          )),
        ),
      ),
    );
  }
}
