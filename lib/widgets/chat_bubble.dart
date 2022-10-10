import 'package:flutter/material.dart';
import 'package:flutter_app/model/chat_message_entity.dart';
import '../service/auth_service.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {

  final ChatMessageEntity chatMessageEntity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.chatMessageEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isAuthor = chatMessageEntity.author.userName == context.read<AuthService>().getUserName();

    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),  //It will take 50% of the screen.
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${chatMessageEntity.text}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if(chatMessageEntity.imageUrl != null)
              Container(  //Making chat list images round
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(image:  NetworkImage(chatMessageEntity.imageUrl!)),
                    borderRadius: BorderRadius.circular(12)),
              )
          ],
        ),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isAuthor ? Theme.of(context).primaryColor : Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
