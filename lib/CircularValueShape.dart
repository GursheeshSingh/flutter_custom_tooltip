import 'package:flutter/material.dart';
import 'package:flutter_custom_tooltip/constants.dart';

class CircularValueShape extends SliderComponentShape {
  //The radius of the value indicator
  final double radius;

  //The border thickness of the value indicator
  final double borderThickness;

  //the value of the slider
  final double _value;

  const CircularValueShape(this._value,
      {this.radius = 6.0, this.borderThickness = 2});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = sliderTheme.thumbColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    //creating the textStyle
    final textStyle = TextStyle(
      color: kCoolPurple,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
    //creating the text span
    final textSpan = TextSpan(
      text: _value.toInt().toString(),
      style: textStyle,
    );
    //creating the text painter
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 50,
    );

    //creating the tooltip position
    Offset toolTipOffset = Offset(center.dx, center.dy - radius - 30);

    //creating the text position
    Offset textOffset =
        Offset(toolTipOffset.dx - textPainter.width / 2, toolTipOffset.dy - 10);

    canvas.drawCircle(toolTipOffset, radius, fillPaint);
    canvas.drawCircle(toolTipOffset, radius, borderPaint);

    textPainter.paint(canvas, textOffset);
  }
}
