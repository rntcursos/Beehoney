import 'package:beehoney/Objs/obj.dart';

class Flower extends Obj {
  move(dt, speed) {
    y += speed * dt;

    if (y > 900) {
      y = -50;
      x = random(50, 500);
    }
  }
}
