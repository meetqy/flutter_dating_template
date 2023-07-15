import '../../domain/entity/user.dart';

class UserModel {
  final String id;
  final String username;
  final int followers;
  final List<String> matchedUser;
  final String? imgpath;

  const UserModel(
      {required this.id,
      required this.username,
      this.followers = 0,
      this.matchedUser = const [],
      this.imgpath});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      followers: json['followers'],
      matchedUser: json['matchedUser'],
      imgpath: json['imgpath'],
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      username: user.username.value,
      followers: user.followers,
      matchedUser: user.matchedUser,
      imgpath: user.imgpath,
    );
  }


  User toEntity() {
    return User(
      id: id,
      username: Username.dirty(username),
      imgpath: imgpath,
      followers: followers,
      matchedUser: matchedUser
    );
  }
}
