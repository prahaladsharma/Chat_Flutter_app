import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  ChatPage({Key? key}) : super(key: key);

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('Chat Message: ${chatMessageController.text}');
  }

  @override
  Widget build(BuildContext context) {

    final userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $userName'),
        actions: [
          IconButton(
              onPressed: () {
                //TODO: Navigate back to LoginPage on layout
                Navigator.pop(context);
                print('Logout Icon press!!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            //Flexible
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your mrssage',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
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
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your mrssage',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
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
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your mrssage',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
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
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your mrssage',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
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
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your mrssage',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
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
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  color: Colors.white,
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
                      hintText: "Enter your message here",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      border: InputBorder.none),
                )),
                IconButton(
                  onPressed: onSendButtonPressed,
                  icon: Icon(Icons.send),
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          )
        ],
      ),
    );
  }
}
