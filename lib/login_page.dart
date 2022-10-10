import 'package:flutter/material.dart';
import 'package:flutter_app/chat_page.dart';
import 'package:flutter_app/service/auth_service.dart';
import 'package:flutter_app/utils/textfield_style.dart';
import 'package:flutter_app/widgets/login_text_field.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'utils/spaces.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  Future<void> loginPage(BuildContext context) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      await context.read<AuthService>().loginUser(userNameController.text);

      // Navigate to chatpage on successfull login
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

  Widget _buildHeader(context) {
    return Column(
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
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
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
      ],
    );
  }

  Widget _buildForm(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,  //for login button stretch
      children: [
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
            onPressed: () async {
              await loginPage(context);
            },
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20),
            )),
        //OutlinedButton(onPressed: () {}, child: FlutterLogo()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                if(constraints.maxWidth > 1000){
                  //render web layout
                  return Row(
                    children: [
                      Spacer(flex: 1,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildHeader(context),
                            _buildFooter(),
                          ],
                        ),
                      ),
                      Spacer(flex: 1,),
                      Expanded(child: _buildForm(context)),
                      Spacer(flex: 1,),
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(context),
                    _buildForm(context),
                    _buildFooter()
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
