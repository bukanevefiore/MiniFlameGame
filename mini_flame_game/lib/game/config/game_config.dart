import 'package:flame/components.dart';

class GameConfig {
  GameConfig._();

  static final Vector2 resolution = Vector2(360, 640);

  static const double playerSpeed = 350;

  static const double enemySpeed = 230;

  static const double spawnInterval = 1.2;
}