import 'package:flutter/material.dart';
import 'package:flutter_app/chat_page.dart';
import 'package:flutter_app/utils/textfield_style.dart';
import 'package:flutter_app/widgets/login_text_field.dart';

import 'utils/spaces.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  void loginPage(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      //TODO: Navigate to chatpage on successfull login
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');

      print("Login Succedd!");
    } else {
      print("Login not successful");
    }
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
              Image.asset(
                'assets/illustration.png',
                //'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                  height: 200),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText:"Enter your username",
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Your username should be more than 5 character";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hasAsterisks: true,
                      hintText: 'Enter your password',
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              verticalSpacing(20),
              ElevatedButton(
                  onPressed: () {
                    loginPage(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  )),
              OutlinedButton(onPressed: () {}, child: FlutterLogo()),
              GestureDetector(
                onDoubleTap: () {
                  print('Double tap');
                },
                onLongPress: () {
                  print('on Long press');
                },
                onTap: () {
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
