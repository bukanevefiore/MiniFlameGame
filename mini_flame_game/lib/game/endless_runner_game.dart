import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'world/game_world.dart';

class EndlessRunnerGame extends FlameGame {
  late final CameraComponent cameraComponent;

  @override
  Color backgroundColor() => const Color(0xFF111111);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    world = GameWorld();

    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: 360,
      height: 640,
    );

    camera = cameraComponent;
  }
}