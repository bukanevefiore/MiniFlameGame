import 'package:flame/camera.dart';
import 'package:flame/game.dart';

import 'world/game_world.dart';

class EndlessRunnerGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final gameWorld = GameWorld();

    world = gameWorld;

    camera = CameraComponent.withFixedResolution(
      world: gameWorld,
      width: 360,
      height: 640,
    );
  }
}