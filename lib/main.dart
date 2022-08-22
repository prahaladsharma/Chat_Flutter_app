import 'package:flutter/material.dart';
import 'package:flutter_app/chat_page.dart';
import 'package:flutter_app/login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: ChatPage(),
    );
  }
}


