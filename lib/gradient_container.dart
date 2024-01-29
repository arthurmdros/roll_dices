import 'package:flutter/material.dart';
import 'package:roll_dices/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  // ARGUMENTOS NOMEADOS VAO DENTRO DO CONSTRUTOR {}
  const GradientContainer({super.key, required this.usedColors});

  final List<Color> usedColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: usedColors, begin: startAlignment, end: endAlignment),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
