import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/endless_runner_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final game = EndlessRunnerGame();

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const ['MainMenu'],
      overlayBuilderMap: {
        'MainMenu': (context, EndlessRunnerGame game) {
          return Container(
            color: Colors.black87,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "SPACE SHOOTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Best Score: 0",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      game.overlays.remove("MainMenu");
                      game.resumeEngine();
                    },
                    child: const Text("START GAME"),
                  ),
                ],
              ),
            ),
          );
        },
      },
    ),
  );
}