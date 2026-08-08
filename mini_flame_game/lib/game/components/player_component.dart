import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';

import 'enemy_component.dart';
import '../endless_runner_game.dart';
import 'bullet_component.dart';
import 'game_over_text_component.dart';

class PlayerComponent extends //SpriteComponent //{
                              RectangleComponent //{
    with
        DragCallbacks,
        CollisionCallbacks,
        HasGameReference<EndlessRunnerGame> {
    //with HasGameReference<EndlessRunnerGame> {

  double _shootTimer = 0;

  PlayerComponent()
      : super(
    position: Vector2(180, 560),
    size: Vector2(40, 40),
    anchor: Anchor.center,
    paint: Paint()
      ..color = Colors.blue,
  );

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
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

    if (other is EnemyComponent && !game.isGameOver) {

      game.isGameOver = true;
      debugPrint("CURRENT SCORE: ${game.score}");
      debugPrint("CURRENT BEST SCORE: ${game.bestScore}");

      if (game.score > game.bestScore) {
        game.bestScore = game.score;
        debugPrint("BEST SCORE SAVED::: ${game.bestScore}");
        game.saveBestScore();
      }

      //game.world.add(GameOverTextComponent(),); hata oluşturduğu için beklemeye alındı

      game.pauseEngine();

      game.overlays.add('GameOver');
      print("GAME OVER");
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    _shootTimer += dt;

    if (_shootTimer >= 0.35) {
      _shootTimer = 0;

      parent?.add(
        BulletComponent(
          position: Vector2(
            position.x,
            position.y - 35,
          ),
        ),
      );
    }
  }

 /* PlayerComponent();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    try {
      sprite = await game.loadSprite('images/player/player.png');
      //sprite = await Sprite.load('images/player/player.png');
      debugPrint("PLAYER LOADED");
    } catch (e) {
      debugPrint("PLAYER ERROR: $e");
    }

    size = Vector2(48, 48);
    anchor = Anchor.center;
    position = Vector2(180, 560);
  } */
}
