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
  // String centerLetter;
  List<String> letters;
  // int spellingCount;

  SpellingBeeModel({
    // required this.centerLetter,
    required this.letters,
    // required this.spellingCount,
  });

  factory SpellingBeeModel.fromJson(Map<String, dynamic> json) =>
      SpellingBeeModel(
        // centerLetter: json["centerLetter"],
        letters: List<String>.from(json["letters"].map((x) => x)),
        // spellingCount: json["spellingCount"],
      );

  Map<String, dynamic> toJson() => {
        // "centerLetter": centerLetter,
        // "spellingCount": spellingCount,
        "letters": List<String>.from(letters.map((x) => x)),
      };
}

List<SpellingBeeModel> spellingBeeList = [
  // SpellingBeeModel(
  //   centerLetter: "E",
  //   letters: ['C', 'O', 'D', 'X', 'Z', 'T'],
  //   spellingList: [
  //     'CODE',
  //     'EXOTIC',
  //     'EXITED',
  //     'COTED',
  //   ],
  // ),
  SpellingBeeModel(
    letters: ["O", "T", "P", "E", "L", "A", "C"],
  ),
  SpellingBeeModel(
    letters: ["A", "R", "T", "O", "P", "L", "E"],
  ),
  SpellingBeeModel(
    letters: ["E", "N", "T", "O", "R", "C", "L"],
  ),
  SpellingBeeModel(
    letters: ["I", "S", "T", "O", "R", "N", "C"],
  ),
  SpellingBeeModel(
    letters: ["U", "S", "T", "O", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["A", "M", "T", "O", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["E", "L", "T", "O", "R", "N", "C"],
  ),
  SpellingBeeModel(
    letters: ["I", "L", "T", "O", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["A", "C", "T", "O", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["O", "S", "T", "A", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["E", "L", "T", "A", "R", "N", "C"],
  ),
  SpellingBeeModel(
    letters: ["U", "S", "T", "A", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["I", "L", "T", "A", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["O", "C", "T", "A", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["E", "L", "T", "O", "R", "N", "A"],
  ),
  SpellingBeeModel(
    letters: ["A", "S", "T", "O", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["U", "L", "T", "O", "R", "N", "E"],
  ),
  SpellingBeeModel(
    letters: ["A", "T", "R", "O", "N", "E", "L"],
  ),
  SpellingBeeModel(
    letters: ["O", "T", "R", "A", "N", "E", "C"],
  ),
  SpellingBeeModel(
    letters: ["E", "T", "R", "A", "N", "O", "L"],
  ),
  SpellingBeeModel(
    letters: ["I", "T", "R", "A", "N", "O", "C"],
  ),
  SpellingBeeModel(
    letters: ["A", "T", "R", "E", "N", "C", "L"],
  ),
  SpellingBeeModel(
    letters: ["M", "G", "I", "D", "S", "E", "O"],
  ),
  SpellingBeeModel(
    letters: ["B", "L", "A", "C", "K", "Y", "E"],
  ),
  SpellingBeeModel(
    letters: ["F", "T", "O", "R", "U", "S", "E"],
  ),
  SpellingBeeModel(
    letters: ["D", "N", "A", "G", "R", "E", "O"],
  ),
  SpellingBeeModel(
    letters: ["C", "H", "I", "T", "S", "O", "E"],
  ),
  SpellingBeeModel(
    letters: ["M", "A", "T", "R", "O", "E", "S"],
  ),
  SpellingBeeModel(
    letters: ["B", "E", "A", "R", "K", "O", "T"],
  ),
  SpellingBeeModel(
    letters: ["L", "I", "G", "H", "T", "E", "N"],
  ),
  SpellingBeeModel(
    letters: ["S", "H", "A", "R", "E", "T", "C"],
  ),
  SpellingBeeModel(
    letters: ["D", "O", "C", "K", "A", "R", "E"],
  ),
  SpellingBeeModel(
    letters: ["B", "R", "A", "N", "D", "O", "E"],
  ),
  SpellingBeeModel(
    letters: ["T", "C", "A", "R", "E", "N", "O"],
  ),
  SpellingBeeModel(
    letters: ["M", "A", "T", "O", "R", "E", "N"],
  ),
  SpellingBeeModel(
    letters: ["G", "R", "A", "D", "E", "T", "O"],
  ),
  SpellingBeeModel(
    letters: ["F", "A", "R", "M", "E", "N", "T"],
  ),
  SpellingBeeModel(
    letters: ["F", "A", "R", "M", "E", "N", "T"],
  ),
  SpellingBeeModel(
    letters: ["B", "A", "S", "E", "L", "O", "N"],
  ),
  SpellingBeeModel(
    letters: ["D", "A", "R", "E", "T", "O", "N"],
  ),
  SpellingBeeModel(
    letters: ["C", "A", "R", "E", "T", "O", "N"],
  ),
  SpellingBeeModel(
    letters: ["M", "A", "T", "E", "R", "O", "N"],
  ),
  SpellingBeeModel(
    letters: ["L", "A", "T", "E", "R", "O", "N"],
  ),
  SpellingBeeModel(
    letters: ["S", "A", "T", "E", "R", "O", "N"],
  ),
  SpellingBeeModel(
    letters: ["B", "A", "T", "E", "R", "O", "N"],
  ),
  SpellingBeeModel(
    letters: ["U", "B", "I", "Q", "T", "E", "R"],
  ),
  SpellingBeeModel(
    letters: ["F", "U", "N", "C", "T", "I", "O"],
  ),
  SpellingBeeModel(
    letters: ["S", "H", "I", "N", "E", "T", "O"],
  ),
  SpellingBeeModel(
    letters: ["D", "R", "I", "V", "E", "T", "O"],
  ),
  SpellingBeeModel(
    letters: ["B", "L", "O", "C", "K", "E", "T"],
  ),
  SpellingBeeModel(
    letters: ["C", "L", "A", "S", "T", "E", "I"],
  ),
  SpellingBeeModel(
    letters: ["R", "A", "M", "P", "L", "E", "S"],
  ),
  SpellingBeeModel(
    letters: ["B", "A", "C", "E", "R", "T", "I"],
  ),
  SpellingBeeModel(
    letters: ["C", "A", "R", "B", "T", "S", "E"],
  ),
  SpellingBeeModel(
    letters: ["S", "A", "P", "R", "E", "M", "T"],
  ),
  SpellingBeeModel(
    letters: ["B", "O", "A", "R", "L", "T", "S"],
  ),
  SpellingBeeModel(
    letters: ["G", "A", "L", "E", "S", "P", "T"],
  ),
  SpellingBeeModel(
    letters: ["C", "L", "A", "T", "E", "R", "S"],
  ),
  SpellingBeeModel(
    letters: ["S", "E", "T", "R", "I", "L", "A"],
  ),
  SpellingBeeModel(
    letters: ["R", "E", "B", "A", "L", "O", "S"],
  ),
  SpellingBeeModel(
    letters: ["P", "A", "T", "E", "L", "O", "S"],
  ),
  SpellingBeeModel(
    letters: ["C", "E", "R", "A", "L", "S", "T"],
  ),
  SpellingBeeModel(
    letters: ["B", "E", "C", "L", "A", "R", "S"],
  ),
  SpellingBeeModel(
    letters: ["C", "E", "B", "L", "A", "R", "S"],
  ),
  SpellingBeeModel(
    letters: ["D", "M", "I", "N", "L", "O", "T"],
  ),
];
