import 'package:flame/components.dart';

import '../components/background_component.dart';
import '../components/player_component.dart';
import '../components/enemy_component.dart';
import '../managers/enemy_spawn_manager.dart';
import '../components/score_text_component.dart';

class GameWorld extends World {

  late PlayerComponent player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());

    player = PlayerComponent();
    add(player);


   /* add(
      EnemyComponent(
        position: Vector2(180, 50),
      ),
    ); */

    add(EnemySpawnManager());
    add(ScoreTextComponent());

  }

  void resetWorld() {
    player.position = Vector2(180, 560);

    children.whereType<EnemyComponent>().forEach((enemy) {
      enemy.removeFromParent();
    });
  }
}