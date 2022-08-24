import 'package:flutter/material.dart';
import 'package:flutter_app/chat_page.dart';
import 'package:flutter_app/counter_stateful_widget.dart';
import 'package:flutter_app/login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(primarySwatch: Colors.deepPurple, appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      //home:  LoginPage(),
      home: ChatPage(),
      //home:  CounterStateful(buttonColor:Colors.blue),
    );
  }
}


