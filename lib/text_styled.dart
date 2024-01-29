import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextStyled extends StatelessWidget {
  // ARGUMENTOS NAO NOMEADOS VAO FORA DO CONSTRUTOR {}
  const TextStyled(this.textUsed, {super.key});

  final String textUsed;

  @override
  Widget build(BuildContext context) {
    return Text(textUsed,
        style: const TextStyle(color: Colors.white, fontSize: 28));
  }
}
