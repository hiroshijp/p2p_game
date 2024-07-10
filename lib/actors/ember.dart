import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

import '../ember_quest_game.dart';

class Ember extends SpriteAnimationComponent with HasGameReference<EmberQuestGame> {
  Ember({
    required super.position,
  }) : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
        );

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }
}
