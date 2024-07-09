import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class HelloGame extends FlameGame {

  late final RectangleComponent _rect;
  late final JoystickComponent _joystick;
  final _speed = 10.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _rect = RectangleComponent(
      position: Vector2(size.x * 0.5, size.y * 0.5),
      size: Vector2.all(size.x * 0.1),
      anchor: Anchor.center,
    );
    await add(_rect);

    _joystick =  JoystickComponent(
      knob: CircleComponent(
        radius: 16,
        paint: BasicPalette.white.withAlpha(200).paint(),
      ),
      background: CircleComponent(
        radius: 40,
        paint: BasicPalette.white.withAlpha(200).paint(),
      ),
      margin: const EdgeInsets.only(
        left: 16,
        bottom: 32,
      ),
    );
    await add(_joystick);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _rect.position += _joystick.delta * _speed * dt;
  }
}

