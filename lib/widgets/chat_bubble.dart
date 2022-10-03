import 'package:flutter/material.dart';
import 'package:flutter_app/model/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {

  final ChatMessageEntity chatMessageEntity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.chatMessageEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),  //It will take 50% of the screen.
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${chatMessageEntity.text}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if(chatMessageEntity.imageUrl != null)
              Image.network(
              '${chatMessageEntity.imageUrl}',
              height: 200,
            )
          ],
        ),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
