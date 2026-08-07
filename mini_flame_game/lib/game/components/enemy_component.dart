import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';

class EnemyComponent extends RectangleComponent //{
    with CollisionCallbacks {

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

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(RectangleHitbox());
  }

}