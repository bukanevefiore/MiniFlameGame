import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config/game_config.dart';

class GameOverTextComponent extends TextComponent {
  GameOverTextComponent()
      : super(
    text: 'GAME OVER',
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    position = GameConfig.resolution / 2;

    textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.red,
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}