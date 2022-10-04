import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/chat_message_entity.dart';
import 'package:flutter_app/widgets/chat_bubble.dart';
import 'package:flutter_app/widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
   ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  //initiate state of message
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    //So here we are using async code
    //either we can use await() or then() (just similar to Java Script)
    await rootBundle.loadString('assets/mock_message.json').then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(_chatMessages.length);

      //final state of the messages
      setState(() {
        _messages = _chatMessages;
      });
    }).then((_) {  //_ for if you not expecting any result
      print('Neated then for async');
    });

    //This print will execute either above code give response or not
    print('It will be print without blocking');

  }

  onMessageSent(ChatMessageEntity entity){
    _messages.add(entity);
    setState(() {});
  }


  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $userName!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                print('Logout Icon press!!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded( //Flexible
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index){
                  return ChatBubble(
                      alignment: _messages[index].author.userName == 'prahalad'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      chatMessageEntity: _messages[index]);
                }),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          )
        ],

      ),

    );
  }
}