import 'package:flutter/material.dart';
import 'package:coin_game/Screens/InstructionsScreen.dart';
import 'package:coin_game/Screens/StartGameScreen.dart';
import 'package:coin_game/Screens/PlayGameScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayGameScreen(playerName: 'nj',),
    );
  }
}
