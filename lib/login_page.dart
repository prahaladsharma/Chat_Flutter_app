import 'package:flutter/material.dart';
import 'package:flutter_app/chat_page.dart';
import 'package:flutter_app/utils/textfield_style.dart';
import 'package:flutter_app/widgets/login_text_field.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final _mainUrl = 'https://swapi.co';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
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
              verticalSpacing(24),
              Container(  //Making login banner image round
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth, //It will stretch the image
                        image:  AssetImage('assets/illustration.png')),
                    borderRadius: BorderRadius.circular(12)),
              ),
              verticalSpacing(24),
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
                onTap: ()  async{
                  print('Link clicked');
                  if (!await launchUrl(Uri.https(_mainUrl, 'api/people'))) {
                    throw 'Could not launch';
                  }
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text(_mainUrl),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.twitter(
                    size: 20,
                    color: Colors.blue,
                    url: "https://twitter.com",
                  ),
                  SocialMediaButton.linkedin(
                    size: 20,
                    color: Colors.blue,
                    url: "https://linkedin.com"
                  )
                ],
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
