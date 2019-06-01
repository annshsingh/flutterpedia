
import 'package:flutterpedia/modals/user.dart';

class Post{
  final String title;
  final String image;
  final String link;
  final String description;
  final List<String>tags;
  final String type;
  final User user;

  Post({this.title,this.link,  this.image, this.description, this.tags, this.type, this.user});

  Post.fromJson(var json):
      title=json['title'],
  image=json['image'],
  description=json['description'],
  tags=List<String>.from(json['tags'] as List),
  type=json['type'],
  user=User.fromJson(json['user']),
  link=json['link'];

  Map toJson(){
    return {
      "title":title,
      "image":image,
      "description":description,
      "tags":tags,
      "type":type,
      "user":user.toJson(),
      'link':link
    };
  }
}