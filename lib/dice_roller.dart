import 'dart:math';

import 'package:flutter/material.dart';

// variavel global que mantém o objeto criado sem precisar recriar ele a cada momento que o estado do widget é alterado
final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 150).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object's value.
        });
      });
    controller.forward();
  }

  var currentDiceRoll = 1;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1; // 0 <> 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // bem parecido com a interpolação no angular que usamos o ${} ou {{}} no html o flutter permite usar da seguinte forma
        // $variavel
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          height: animation.value,
          width: animation.value,
        ),
        Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
              ),
              label: const Text(
                'JOGUE O DADO',
                style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              icon: const Icon(
                Icons.gamepad_outlined,
                color: Colors.indigo,
                size: 24,
              ),
            ))
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
