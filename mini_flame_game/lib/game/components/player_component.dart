import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import '../endless_runner_game.dart';

class PlayerComponent extends //SpriteComponent //{
                              RectangleComponent //{
    with DragCallbacks {
    //with HasGameReference<EndlessRunnerGame> {
  PlayerComponent()
      : super(
    position: Vector2(180, 560),
    size: Vector2(40, 40),
    anchor: Anchor.center,
    paint: Paint()
      ..color = Colors.blue,
  );

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }

 /* PlayerComponent();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    try {
      sprite = await game.loadSprite('images/player/player.png');
      //sprite = await Sprite.load('images/player/player.png');
      debugPrint("PLAYER LOADED");
    } catch (e) {
      debugPrint("PLAYER ERROR: $e");
    }

    size = Vector2(48, 48);
    anchor = Anchor.center;
    position = Vector2(180, 560);
  } */
}
