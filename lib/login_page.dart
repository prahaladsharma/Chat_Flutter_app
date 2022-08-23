import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  void loginPage() {
    print("Login Succedd!");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Let\'s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
              Text(
                'Welcome back! \n you\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image.network(
                  'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                  height: 200),
              ElevatedButton(
                  onPressed: loginPage,
                  child: Text(
                    'Click Me',
                    style: TextStyle(fontSize: 20),
                  )),
              OutlinedButton(onPressed: () {}, child: FlutterLogo()),
              TextButton(
                  onPressed: () {

                  },
                  child: Text('https://google.com'))
            ],
          ),
        ),
      ),
    );
  }
}
