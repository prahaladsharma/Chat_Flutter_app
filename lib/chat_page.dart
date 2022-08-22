import 'package:flutter/material.dart';
import 'package:flutter_app/widget/chat_bubble.dart';
import 'package:flutter_app/widget/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi Prahalad'),
        actions: [
          IconButton(
              onPressed: () {
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
                message:"Hi This is Prhalad",
              );
            })
          ),
          ChatInput()
        ],
          
      ),
        
    );
  }
}
