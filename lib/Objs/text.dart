import 'package:flame/components.dart';

class GameText extends TextComponent {
  GameText(String text, double x, double y, color)
      : super(text,
            position: Vector2(x, y),
            textRenderer: TextPaint(
              config: TextPaintConfig(color: color),
            ));
}
