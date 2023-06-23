import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animación de Texto'),
      ),
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              '¡Hola!',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            FadeAnimatedText(
              '¡Bienvenido!',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            FadeAnimatedText(
              'Soy JJ!',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}
