import 'package:flutter/material.dart';
import 'package:flutter_with_nodejs_1/screens/create_room_screen.dart';
import 'package:flutter_with_nodejs_1/screens/game_screen.dart';
import 'package:flutter_with_nodejs_1/screens/join_room_screen.dart';
import 'package:flutter_with_nodejs_1/screens/main_menu_screen.dart';
import 'package:flutter_with_nodejs_1/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
