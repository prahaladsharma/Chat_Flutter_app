import 'package:flutter/material.dart';
import 'package:flutter_app/model/chat_message_entity.dart';
import 'package:flutter_app/widgets/picker_body.dart';
import '../service/auth_service.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatefulWidget {

  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUrl = '';

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() async {
    String userNameFromCache = await context.read<AuthService>().getUserName();
    print('ChatMessage: ${chatMessageController.text}');

    // Add new message to the default list
    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: "101",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: userNameFromCache!)
    );

    if(_selectedImageUrl.isNotEmpty){
      newChatMessage.imageUrl = _selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);

    //After sending text message and image, we have to empty the chat input box,
    chatMessageController.clear();
    _selectedImageUrl = '';
    setState(() {});
  }

  //Here we get image on Tap and assign to _selectedImageUrl
  //So then it will show on chat input widget
  void onImagePicked(String newImageUrl){
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();  //After tap  on image, we will closing the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {

              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                return NetworkImagePickerBody(onImageSelected: onImagePicked,);
              });


            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  //It will move to taped image on left-start of the widget.
                children: [
                  TextField(
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
                  ),
                  if(_selectedImageUrl.isNotEmpty)
                    Image.network(_selectedImageUrl, height: 50,),
                ],
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