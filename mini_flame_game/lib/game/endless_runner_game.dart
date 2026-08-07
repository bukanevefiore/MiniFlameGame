import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'config/game_config.dart';
import 'world/game_world.dart';
import 'managers/game_manager.dart';

class EndlessRunnerGame extends FlameGame //{
    with HasCollisionDetection {

  final GameManager gameManager = GameManager();

  bool isGameOver = false;
  int score = 0;

  @override
  Color backgroundColor() => const Color(0xFF000000);

  void setupGame() {
    final gameWorld = GameWorld();

    world = gameWorld;

    camera = CameraComponent.withFixedResolution(
      world: gameWorld,
      width: GameConfig.resolution.x,
      height: GameConfig.resolution.y,
    );

    camera.viewfinder.position = GameConfig.resolution / 2;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    pauseEngine();

    setupGame();
  }

  void restartGame() {
    overlays.remove('GameOver');

    isGameOver = false;
    score = 0;

    final gameWorld = world as GameWorld;

    gameWorld.resetWorld();

    resumeEngine();

    /*overlays.remove('GameOver');

    isGameOver = false;
    score = 0;
    int bestScore = 0;

    pauseEngine();
    resumeEngine();

    world.removeAll(world.children);

    //world.add(GameWorld()); */
  }

  @override
  void update(double dt) {
    super.update(dt);

    //print("GAME RUNNING");
  }

}