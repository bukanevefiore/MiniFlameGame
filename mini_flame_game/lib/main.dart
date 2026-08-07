import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/endless_runner_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GameWidget(
      game: EndlessRunnerGame(),
    ),
  );
}