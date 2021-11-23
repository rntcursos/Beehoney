import 'dart:async';
import 'package:beehoney/Objs/bee.dart';
import 'package:beehoney/Objs/bg.dart';
import 'package:beehoney/Objs/flower.dart';
import 'package:beehoney/Objs/obj.dart';
import 'package:beehoney/Objs/spider.dart';
import 'package:beehoney/Objs/text.dart';
import 'package:beehoney/game/Util/utils.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BeeHoney extends FlameGame with KeyboardEvents, HasCollidables {
  Bg bg = Bg();
  Bg bg2 = Bg();
  Bg gameover = Bg();
  Bee bee = Bee();
  Spider spider = Spider();
  Flower flower = Flower();

  GameText textScore = GameText("Score: ", 10, 10, BasicPalette.black.color);
  GameText textLifes = GameText("Lifes: ", 380, 10, BasicPalette.black.color);

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);

    add(bg);

    bg2
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, -900);

    add(bg2);

    bee
      ..sprite = await Sprite.load("bee1.png")
      ..size = Vector2.all(50)
      ..position = Vector2(250, 800)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(bee);

    spider
      ..sprite = await Sprite.load("spider1.png")
      ..size = Vector2.all(80)
      ..position = Vector2(250, 500)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(spider);

    flower
      ..sprite = await Sprite.load("florwer1.png")
      ..size = Vector2.all(30)
      ..position = Vector2(200, 400)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(flower);

    add(textLifes);
    add(textScore);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dt, 100, 900, 0);
    bg2.move(dt, 100, 0, -900);

    bee.move(dt, 10);
    bee.animation(8, 4, "bee");

    spider.move(dt, bee);
    spider.animation(8, 4, "spider");

    flower.move(dt, 200);
    flower.animation(8, 2, "florwer");

    if (gameOver) {
      pauseEngine();
      overlays.add("GameOver");
    }

    textScore.text = textPts + score.toString();
    textLifes.text = lifesTxt + lifes.toString();

    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.data.keyLabel == "a") {
      bee.left = true;
    } else {
      bee.left = false;
    }
    if (event.data.keyLabel == "d") {
      bee.right = true;
    } else {
      bee.right = false;
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
