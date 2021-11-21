import 'package:flame/components.dart';

class Bg extends SpriteComponent {
  move(dt, speed, limit, posy) {
    y += speed * dt;

    if (y >= limit) {
      y = posy;
    }
  }
}
