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
  List<String> letters;
  List<String> spellingList;

  SpellingBeeModel({
    required this.centerLetter,
    required this.letters,
    required this.spellingList,
  });

  factory SpellingBeeModel.fromJson(Map<String, dynamic> json) =>
      SpellingBeeModel(
        centerLetter: json["centerLetter"],
        letters: List<String>.from(json["letters"].map((x) => x)),
        spellingList: List<String>.from(json["spelling_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "centerLetter": centerLetter,
        "letters": List<String>.from(letters.map((x) => x)),
        "spelling_list": List<String>.from(spellingList.map((x) => x)),
      };
}

List<SpellingBeeModel> spellingBeeList = [
  SpellingBeeModel(
    centerLetter: "E",
    letters: ['C', 'O', 'D', 'X', 'Z', 'T'],
    spellingList: [
      'CODE',
      'EXOTIC',
      'EXITED',
      'COTED',
    ],
  ),
];
