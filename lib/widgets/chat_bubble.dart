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
              height: 80,
            )
          ],
        ),
        margin: EdgeInsets.all(20),
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
