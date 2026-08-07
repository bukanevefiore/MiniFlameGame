import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class EnemyComponent extends RectangleComponent {
  EnemyComponent({
    required Vector2 position,
  }) : super(
    position: position,
    size: Vector2(40, 40),
    anchor: Anchor.center,
    paint: Paint()..color = Colors.red,
  );

  @override
  void update(double dt) {
    super.update(dt);

    position.y += 200 * dt;
  }
}