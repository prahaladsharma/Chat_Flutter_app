import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/chat_message_entity.dart';
import 'package:flutter_app/widgets/chat_bubble.dart';
import 'package:flutter_app/widgets/chat_input.dart';
import 'package:http/http.dart' as http;

import 'model/image_model.dart';

class ChatPage extends StatefulWidget {
   ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  //initiate state of message
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_message.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    print(_chatMessages.length);

    //final state of the messages
    setState(() {
      _messages = _chatMessages;
    });
  }

  onMessageSent(ChatMessageEntity entity){
    _messages.add(entity);
    setState(() {});
  }

  //getImage network API
  _getImageNetwork() async {
    var endPointUrl = Uri.parse('https://pixelford.com/api2/images');
    final response = await http.get(endPointUrl);
    //print(response.body);

    if(response.statusCode == 200) {
      final List<dynamic> decodedList = jsonDecode(response.body) as List;

      final List<PixelfordImage> _imageList = decodedList.map((listItem) {
        return PixelfordImage.fromJson(listItem);
      }).toList();
      print(_imageList[0].urlFullSize);
    }

  }


  @override
  void initState() {
    _loadInitialMessages();
    _getImageNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getImageNetwork();
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