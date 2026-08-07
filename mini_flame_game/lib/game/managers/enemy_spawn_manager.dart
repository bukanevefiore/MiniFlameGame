import 'dart:math';

import 'package:flame/components.dart';

import '../components/enemy_component.dart';
import '../endless_runner_game.dart';

class EnemySpawnManager extends Component //{
    with HasGameReference<EndlessRunnerGame> {

  final Random _random = Random();

  double _timer = 0;

  @override
  void update(double dt) {
    if ((game as EndlessRunnerGame).isGameOver) {
      return;
    }

    super.update(dt);

    _timer += dt;

    if (_timer >= 1.2) {
      _timer = 0;

      final x = 20 + _random.nextDouble() * 320;

      parent?.add(
        EnemyComponent(
          position: Vector2(x, -30),
        ),
      );
    }
  }
}