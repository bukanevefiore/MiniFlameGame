import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'config/game_config.dart';
import 'world/game_world.dart';

class EndlessRunnerGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF000000);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final gameWorld = GameWorld();

    world = gameWorld;

    camera = CameraComponent.withFixedResolution(
      world: gameWorld,
      width: GameConfig.resolution.x,
      height: GameConfig.resolution.y,
    );

    camera.viewfinder.position = GameConfig.resolution / 2;
  }
}