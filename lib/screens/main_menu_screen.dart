import 'package:flutter/material.dart';
import 'package:flutter_with_nodejs_1/resources/socket_methods.dart';
import 'package:flutter_with_nodejs_1/screens/create_room_screen.dart';
import 'package:flutter_with_nodejs_1/screens/join_room_screen.dart';
import 'package:flutter_with_nodejs_1/widgets/custom_button.dart';

import '../responsive/responsive.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';

  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final SocketMethods _socketMethods = SocketMethods();
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () => createRoom(context),
              text: 'Create Room',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () => joinRoom(context),
              text: 'Join Room',
            ),
          ],
        ),
      ),
    );
  }
}
