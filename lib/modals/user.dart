
class User{
  static User _user;
  final String id;
  final String name;
  final String profilePic;

  User({this.id, this.name, this.profilePic});

  User.fromJson(json):
      id=json['id'],
      name=json['name'],
      profilePic=json['profilePic'];

  Map<String,String> toJson(){
    return {
      "id":id,
      "name":name,
      "profilePic":profilePic
    };
  }
}
