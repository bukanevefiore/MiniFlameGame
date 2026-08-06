import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BackgroundComponent extends PositionComponent {
  BackgroundComponent();

  @override
  Future<void> onLoad() async {
    size = Vector2(360, 640);

    add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFF1E1E1E),
      ),
    );
  }
}