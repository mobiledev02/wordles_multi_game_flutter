// To parse this JSON data, do
//
//     final introScreenModel = introScreenModelFromJson(jsonString);

import 'dart:convert';

import 'package:wordles_multi_game_flutter/constants/constant_image.dart';
import 'package:wordles_multi_game_flutter/constants/constant_string.dart';
import 'package:wordles_multi_game_flutter/utils/custom_enum.dart';

IntroScreenModel introScreenModelFromJson(String str) =>
    IntroScreenModel.fromJson(json.decode(str));

String introScreenModelToJson(IntroScreenModel data) =>
    json.encode(data.toJson());

class IntroScreenModel {
  String title;
  String subTitle;
  String bgImage;
  String image;
  Games game;

  IntroScreenModel({
    required this.title,
    required this.subTitle,
    required this.bgImage,
    required this.image,
    required this.game,
  });

  factory IntroScreenModel.fromJson(Map<String, dynamic> json) =>
      IntroScreenModel(
        title: json["title"],
        subTitle: json["subTitle"],
        bgImage: json["bg_image"],
        image: json["image"],
        game: json["game"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "bg_image": bgImage,
        "image": image,
      };
}

List<IntroScreenModel> introList = [
  IntroScreenModel(
    title:
        ConstantString.getGamesTitle(Games.theCrosswords).replaceAll("\n", " "),
    subTitle: "How many words can you\nmake with 7 letters?",
    bgImage: ConstantImage.getGamesScreenBgImage(Games.theCrosswords),
    image: ConstantImage.getGamesScreenImage(Games.theCrosswords),
    game: Games.theCrosswords,
  ),
  IntroScreenModel(
    title:
        ConstantString.getGamesTitle(Games.spellingBee).replaceAll("\n", " "),
    subTitle: "How many words can you\nmake with 7 letters?",
    bgImage: ConstantImage.getGamesScreenBgImage(Games.spellingBee),
    image: ConstantImage.getGamesScreenImage(Games.spellingBee),
    game: Games.spellingBee,
  ),
];
