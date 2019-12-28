import 'package:flutter/material.dart';

import 'CircularValueShape.dart';
import 'RoundedRectangleThumbShape.dart';
import 'constants.dart';

class BallonSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: BalloonSlider(),
      ),
    );
  }
}

class BalloonSlider extends StatefulWidget {
  @override
  _BalloonSliderState createState() => _BalloonSliderState();
}

class _BalloonSliderState extends State<BalloonSlider>
    with TickerProviderStateMixin {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: RoundedRectangleThumbShape(
          thumbRadius: 12,
          roundness: 5,
          thickness: 12,
        ),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 1),
        inactiveTrackColor: Colors.grey.shade300,
        activeTrackColor: kCoolPurple,
        thumbColor: kCoolPurple,
        valueIndicatorShape: CircularValueShape(_value, radius: 18),
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: Center(
        child: Slider(
          value: _value,
          min: 0,
          max: 100,
          label: '$_value',
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
        ),
      ),
    );
  }
}
