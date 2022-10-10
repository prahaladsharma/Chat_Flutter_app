
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {

  static init() async {
    _prefers = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefers;

  Future<void> loginUser(String userName) async {
    try {
      _prefers.setString('userName', userName);
    } catch(e){
      print(e);
    }
  }

  void logoutUser() {
    _prefers.clear();
  }

  String? getUserName() {
    return _prefers.getString('userName') ?? 'DefaultValue' ;
  }

  Future<bool> isLoggedIn() async {
    String? userName = await _prefers.getString('userName');
    if(userName == null) return false;
    return true;
  }

}