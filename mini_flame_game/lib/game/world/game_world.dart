import 'package:flame/components.dart';

import '../components/background_component.dart';
import '../components/player_component.dart';
import '../components/enemy_component.dart';
import '../managers/enemy_spawn_manager.dart';

class GameWorld extends World {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());

    add(PlayerComponent());

    print("PLAYER ADDED");


   /* add(
      EnemyComponent(
        position: Vector2(180, 50),
      ),
    ); */

    add(EnemySpawnManager());

  }
}