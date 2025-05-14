// To parse this JSON data, do
//
//     final signModel = signModelFromJson(jsonString);

import 'dart:convert';

List<SignModel> signModelFromJson(String str) =>
    List<SignModel>.from(json.decode(str).map((x) => SignModel.fromJson(x)));

String signModelToJson(List<SignModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignModel {
  String name;
  String image;

  SignModel({
    required this.name,
    required this.image,
  });

  factory SignModel.fromJson(Map<String, dynamic> json) => SignModel(
        name: json["name"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "Image": image,
      };
}
