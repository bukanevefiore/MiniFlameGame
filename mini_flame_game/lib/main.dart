import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/endless_runner_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final game = EndlessRunnerGame();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
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
                            "Best Score: ${game.bestScore}",
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

                'GameOver': (context, EndlessRunnerGame game) {
                  return Container(
                    color: Colors.black54,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "GAME OVER",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Score: ${game.score}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              game.restartGame();
                            },
                            child: const Text("RESTART"),
                          ),
                        ],
                      ),
                    ),
                  );
                },

                'PauseMenu': (context, EndlessRunnerGame game) {
                  return Container(
                    color: Colors.black54,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "PAUSED",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              game.overlays.remove("PauseMenu");
                              game.resumeEngine();
                            },
                            child: const Text("CONTINUE"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              },
            ),

            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
                onPressed: () {
                  game.pauseEngine();
                  game.overlays.add("PauseMenu");
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}