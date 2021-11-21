import 'package:beehoney/Objs/flower.dart';
import 'package:beehoney/Objs/obj.dart';
import 'package:beehoney/Objs/spider.dart';
import 'package:beehoney/game/Util/utils.dart';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Bee extends Obj {
  bool right = false;
  bool left = false;

  move(dt, speed) {
    if (right) {
      if (x <= 475) {
        x += speed;
      }
    }

    if (left) {
      if (x >= 25) {
        x -= speed;
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);

    if (other is Spider) {
      other.position.y = -100;
      lifes -= 1;
      if (lifes <= 0) {
        gameOver = true;
      }
    }

    if (other is Flower) {
      other.position.y = -100;
      other.position.x = random(50, 500);
      score += 1;
    }
  }
}
