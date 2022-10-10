import 'package:flutter/material.dart';
import 'package:flutter_app/chat_page.dart';
import 'package:flutter_app/demo/counter_stateful_widget.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/service/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();

  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AuthService(),
      child: ChatApp()));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: FutureBuilder<bool>(
          future: context.read<AuthService>().isLoggedIn(),
          builder: (context, AsyncSnapshot<bool> snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData && snapshot.data!){
                return ChatPage();
              } else return LoginPage();
            }
            return CircularProgressIndicator();
      }),

      routes: {'/chat': (context) => ChatPage()},
      //home:  CounterStateful(buttonColor:Colors.blue),
    );
  }
}
