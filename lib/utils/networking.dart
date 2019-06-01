import 'dart:convert';

import 'package:flutterpedia/modals/user.dart';
import 'package:http/http.dart' as http;

class Networking{
  static final String url='https://flutter-hackathon.herokuapp.com/';
  static Future<bool> registerUser(User user)async{
     http.Response response=await http.post(url+"user/registeration",body: jsonEncode(user.toJson()));
     if(response.statusCode==404){
       return false;
     }
     else{
       return true;
     }
  }
}