import 'package:beehoney/game/Util/utils.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'beehoney.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameWidget(
                game: BeeHoney(),
                overlayBuilderMap: const {"GameOver": gameOverWidget},
              ),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/start.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

Widget gameOverWidget(BuildContext buildContext, BeeHoney game) {
  return GestureDetector(
    onTap: () {
      gameOver = false;
      score = 0;
      lifes = 3;
      Navigator.push(
          buildContext,
          MaterialPageRoute(
            builder: (context) => const MainMenu(),
          ));
    },
    child: SizedBox(
      width: 500,
      height: 900,
      child: Image.asset(
        "images/gameover.png",
        fit: BoxFit.fill,
      ),
    ),
  );
}
