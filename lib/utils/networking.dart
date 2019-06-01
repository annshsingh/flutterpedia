import 'dart:convert';

import 'package:flutterpedia/modals/post.dart';
import 'package:flutterpedia/modals/user.dart';
import 'package:http/http.dart' as http;

class Networking{
  static final String url='https://flutter-hackathon.herokuapp.com/';
  static Future<bool> registerUser(User user)async{
     http.Response response=await http.post(url+"user/registeration",body: jsonEncode(user.toJson()),headers: {"Content-Type":"application/json"});
     print(response.body);
     if(response.statusCode==404){
       return false;
     }
     else{
       User.setUser(user);
       return true;
     }
  }
  static Future<bool> addPost(Post post)async{
    print(post.link);
    http.Response response=await http.post(url+"user/post",body: jsonEncode(post.toJson()),headers: {"Content-Type":"application/json"});
    print(response.body);
    if(response.statusCode==404){
      return false;
    }
    else{
      return true;
    }
  }
  static Future<List<Post>> getPosts(String type)async{
    String url='https://flutterpedia-5bb3d.firebaseio.com/posts/$type.json';
    http.Response response=await http.get(url);
    Map json=jsonDecode(response.body);
    List<Post>posts=[];
    if(json==null){
      return posts;
    }
    json.forEach((key,val){
      posts.add(Post.fromJson(val));
    });
    return posts;
  }
}