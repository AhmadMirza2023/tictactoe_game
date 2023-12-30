import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/pages/home_page.dart';
import 'package:tictactoe/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(
                  top: 60,
                  right: 30,
                  left: 30,
                ),
                child: Text(
                  'TIC TAC TOE',
                  style: myNewFontWhite.copyWith(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: AvatarGlow(
                curve: Curves.decelerate,
                child: CircleAvatar(
                  radius: 100,
                  child: Image.asset(
                    'assets/tictactoe_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 90,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    17,
                  ),
                ),
                child: Text(
                  'Play Game',
                  style: myNewFontBlack.copyWith(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
