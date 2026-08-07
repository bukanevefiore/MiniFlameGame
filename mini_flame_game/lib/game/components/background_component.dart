import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BackgroundComponent extends RectangleComponent {
  BackgroundComponent()
      : super(
    position: Vector2.zero(),
    size: Vector2(360, 640),
    anchor: Anchor.topLeft,
    paint: Paint()..color = Colors.green,
  );
}