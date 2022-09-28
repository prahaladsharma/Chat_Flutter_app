import 'package:flutter/material.dart';
import 'package:flutter_app/model/chat_message_entity.dart';
import 'package:flutter_app/widgets/chat_bubble.dart';
import 'package:flutter_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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
                itemCount: 10,
                itemBuilder: (context, index){
                  return ChatBubble(
                      alignment: index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      chatMessageEntity: ChatMessageEntity(
                        id: '1234',
                        text: 'Hello this is prahalad',
                        createdAt: DateTime.now().microsecondsSinceEpoch,
                        athor: Author(userName: 'prahalad')
                      ));
                }),
          ),
          ChatInput()
        ],

      ),

    );
  }
}