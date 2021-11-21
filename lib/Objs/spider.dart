import 'package:beehoney/Objs/obj.dart';

class Spider extends Obj {
  move(dt, bee) {
    y += 200 * dt;

    if (y > 950) {
      y = -50;
    }

    if (x < bee.x) {
      x += 2;
    }

    if (x > bee.x) {
      x -= 2;
    }
  }
}
