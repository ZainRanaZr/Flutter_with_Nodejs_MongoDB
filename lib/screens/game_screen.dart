import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game-room';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: const Text('data')),
    );
  }
}
