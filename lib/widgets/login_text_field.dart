import 'package:flutter/material.dart';

import '../utils/textfield_style.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;

  const LoginTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
       this.validator,
        this.hasAsterisks = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsterisks,
      validator: (value) {
        /*if (value != null && value.isNotEmpty && value.length < 5) {
          return "Your username should be more than 5 character";
        } else if (value != null && value.isEmpty) {
          return "Please type your username";
        }*/
        if(validator != null) return validator!(value);

        //return null;
      },
      controller: controller,
      decoration: InputDecoration(
          hintText: '$hintText',
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
          border: OutlineInputBorder()),
    );
  }
}
