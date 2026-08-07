import 'package:flame/components.dart';

import '../components/player_component.dart';

class GameWorld extends World {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(PlayerComponent());
  }
}