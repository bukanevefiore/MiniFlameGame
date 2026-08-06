import 'package:flame/components.dart';

import '../components/background_component.dart';

class GameWorld extends World {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      BackgroundComponent(),
    );
  }
}