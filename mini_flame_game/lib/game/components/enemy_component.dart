import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';

import '../endless_runner_game.dart';

class EnemyComponent extends RectangleComponent //{
    with CollisionCallbacks, //{
        HasGameReference<EndlessRunnerGame> {


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

    if (position.y > 700) {
      game.score++;

      print("Score: ${game.score}");

      removeFromParent();
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(RectangleHitbox());
  }

}