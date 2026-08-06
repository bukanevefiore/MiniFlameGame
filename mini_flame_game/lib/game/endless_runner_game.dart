import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class EndlessRunnerGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF111111);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }
}