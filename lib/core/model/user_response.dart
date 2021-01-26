// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);

import 'dart:convert';

List<UserResponse> userResponseFromMap(String str) => List<UserResponse>.from(json.decode(str).map((x) => UserResponse.fromMap(x)));

String userResponseToMap(List<UserResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserResponse {
  UserResponse({
    this.id,
    this.picture,
    this.name,
  });

  String id;
  String picture;
  String name;

  UserResponse copyWith({
    String id,
    String picture,
    String name,
  }) =>
      UserResponse(
        id: id ?? this.id,
        picture: picture ?? this.picture,
        name: name ?? this.name,
      );

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
    id: json["_id"],
    picture: json["picture"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "picture": picture,
    "name": name,
  };
}
