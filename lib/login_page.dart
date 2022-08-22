import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'Let\'s sign you in!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5
                )
            ),
            Text(
                'Welcome back! \n you\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.brown
                ),
            ),
            Image.network(
                'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                 height: 200
            ),
          ],
        ),
      ),
    );
  }
}
