import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends RectangleComponent {
  PlayerComponent()
      : super(
    position: Vector2(180, 560),
    size: Vector2(40, 40),
    anchor: Anchor.center,
    paint: Paint()
      ..color = Colors.blue,
  );
}
