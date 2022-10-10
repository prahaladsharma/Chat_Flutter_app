
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  final Future<SharedPreferences> _prefers = SharedPreferences.getInstance();

  Future<void> loginUser(String userName) async {
    try {
      SharedPreferences sharedPreferences = await _prefers;
      sharedPreferences.setString('userName', userName);
    } catch(e){
      print(e);
    }
  }

  void logoutUser() async {
    SharedPreferences sharedPreferences = await _prefers;
    sharedPreferences.clear();
  }

  Future<String> getUserName() async {
    SharedPreferences sharedPreferences = await _prefers;
    return sharedPreferences.getString('userName') ?? 'DefaultValue' ;

  }
}