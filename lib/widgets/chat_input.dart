import 'package:flutter/material.dart';
import 'package:flutter_app/model/chat_message_entity.dart';

class ChatInput extends StatelessWidget {

  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');
    
    //TODO: Add new message to the default list
    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: "101",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: "prahalad")
    );
    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                controller: chatMessageController,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Type your message",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none),
              )),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    );
  }
}