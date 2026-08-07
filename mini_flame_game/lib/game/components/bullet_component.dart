import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BulletComponent extends RectangleComponent {
  BulletComponent({
    required Vector2 position,
  }) : super(
    position: position,
    size: Vector2(8, 20),
    anchor: Anchor.center,
    paint: Paint()..color = Colors.yellow,
  );

  @override
  void update(double dt) {
    super.update(dt);

    position.y -= 450 * dt;

    if (position.y < -20) {
      removeFromParent();
    }
  }
}