import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config/game_config.dart';

class BackgroundComponent extends RectangleComponent {
  BackgroundComponent()
      : super(
    position: Vector2.zero(),
    size: GameConfig.resolution.clone(),
    anchor: Anchor.topLeft,
    paint: Paint()
      ..color = const Color(0xFF1A1A1A),
  );
}