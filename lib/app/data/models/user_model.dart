import 'dart:convert';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uid,
    this.birthday,
    this.gender,
    this.name,
  });

  String? uid;
  String? birthday;
  String? gender;
  String? name;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"] == null ? null : json["uid"],
        birthday: json["birthday"] == null ? null : json["birthday"],
        gender: json["gender"] == null ? null : json["gender"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "birthday": birthday == null ? null : birthday,
        "gender": gender == null ? null : gender,
        "name": name == null ? null : name,
      };
}
