import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  void loginPage() {
    print(userNameController.text);
    print(passwordController.text);
    print("Login Succedd!");
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

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

              TextField(
                controller: userNameController,
                /*onChanged: (value){ //It will listen to every chat, that we enter in textfield.
                  print('value : $value');
                },*/
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder()
                ),
              ),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter your psddword',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder()
                ),
              ),

              ElevatedButton(
                  onPressed: loginPage,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  )),
              OutlinedButton(onPressed: () {}, child: FlutterLogo()),
              GestureDetector(
                onDoubleTap: (){
                  print('Double tap');
                },
                onLongPress: (){
                  print('on Long press');
                },
                onTap: (){
                  print('Link clicked');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('https://google.com'),
                  ],
                ),
              )

              /*GestureDetector(
                onDoubleTap: (){
                  print('Double tap');
                },
                onLongPress: (){
                  print('on Long press');
                },
                onTap: (){
                  print('Link clicked');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('https://google.com'),
                  ],
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
