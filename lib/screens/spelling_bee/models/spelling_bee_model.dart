// To parse this JSON data, do
//
//     final spellingBeeModel = spellingBeeModelFromJson(jsonString);

import 'dart:convert';

List<SpellingBeeModel> listSpellingBeeModelFromJson(String str) =>
    List<SpellingBeeModel>.from(
        json.decode(str).map((x) => SpellingBeeModel.fromJson(x)));

String listSpellingBeeModelToJson(List<SpellingBeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

SpellingBeeModel spellingBeeModelFromJson(String str) =>
    SpellingBeeModel.fromJson(json.decode(str));

String spellingBeeModelToJson(SpellingBeeModel data) =>
    json.encode(data.toJson());

class SpellingBeeModel {
  String centerLetter;
  List<dynamic> letters;
  List<dynamic> spellingList;

  SpellingBeeModel({
    required this.centerLetter,
    required this.letters,
    required this.spellingList,
  });

  factory SpellingBeeModel.fromJson(Map<String, dynamic> json) =>
      SpellingBeeModel(
        centerLetter: json["centerLetter"],
        letters: List<dynamic>.from(json["letters"].map((x) => x)),
        spellingList: List<dynamic>.from(json["spelling_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "centerLetter": centerLetter,
        "letters": List<dynamic>.from(letters.map((x) => x)),
        "spelling_list": List<dynamic>.from(spellingList.map((x) => x)),
      };
}

List<SpellingBeeModel> spellingBeeList = [];
