import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:flame/collisions.dart';

import '../endless_runner_game.dart';
import 'enemy_component.dart';
import 'explosion_component.dart';

class BulletComponent extends RectangleComponent //{
    with CollisionCallbacks, HasGameReference<EndlessRunnerGame> {

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

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is EnemyComponent) {
      parent?.add(
        ExplosionComponent(
          position: other.position.clone(),
        ),
      );

      other.removeFromParent();
      removeFromParent();

      game.score++;

      debugPrint("Score: ${game.score}");
    }
  }

}