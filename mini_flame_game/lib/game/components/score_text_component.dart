import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../endless_runner_game.dart';

class ScoreTextComponent extends TextComponent
    with HasGameReference<EndlessRunnerGame> {

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    position = Vector2(15, 15);

    textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    text = "Score: ${game.score}";
  }
}