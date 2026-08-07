import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ExplosionComponent extends CircleComponent {
  ExplosionComponent({
    required Vector2 position,
  }) : super(
    radius: 20,
    position: position,
    anchor: Anchor.center,
    paint: Paint()..color = Colors.orange,
  );

  double _life = 0.2;

  @override
  void update(double dt) {
    super.update(dt);

    _life -= dt;

    if (_life <= 0) {
      removeFromParent();
    }
  }

}