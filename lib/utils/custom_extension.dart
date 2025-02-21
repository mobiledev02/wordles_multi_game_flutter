import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//String Extension...
extension StringExtension on String {
  bool get isImage =>
      toLowerCase().endsWith(".jpg") ||
      toLowerCase().endsWith(".jpeg") ||
      toLowerCase().endsWith(".png") ||
      toLowerCase().endsWith(".gif") ||
      toLowerCase().endsWith(".webp") ||
      toLowerCase().endsWith(".heic");
  // Remove Special character from string...
  String get removeSpecialCharacters =>
      trim().replaceAll(RegExp(r'[^A-Za-z0-9]'), '');

  // Process String...
  List<TextSpan> processCaption({
    String matcher = "#",
    TextStyle? fancyTextStyle,
    TextStyle? normalTextStyle,
    void Function(String)? onTap,
  }) {
    return split(' ')
        .map(
          (text) => TextSpan(
            text:
                '${text.toString().contains(matcher) ? text.replaceAll(matcher, "") : text} ',
            style: text.toString().contains(matcher)
                ? fancyTextStyle
                : normalTextStyle,
            recognizer: text.toString().contains(matcher)
                ? onTap == null
                    ? null
                    : (TapGestureRecognizer()..onTap = () => onTap(text))
                : null,
          ),
        )
        .toList();
  }

  String get toFirstLetter {
    String temp = "";
    List<String> splittedWords = isEmpty ? [] : split(" ");

    splittedWords.removeWhere((word) => word.isEmpty);

    if (splittedWords.length == 1) {
      temp = splittedWords[0][0].toUpperCase();
    } else if (splittedWords.length == 2) {
      temp =
          splittedWords[0][0].toUpperCase() + splittedWords[1][0].toUpperCase();
    }

    return temp;
  }

  //Email validation Regular expression...
  static const String emailRegx =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //Validate Name...
  String? get validateName =>
      trim().isEmpty ? "Please enter name" : null; //Validate Name...
  String? get validateMessage =>
      trim().isEmpty ? "Please enter a valid message" : null;

//Validate Email...
  String? get validateEmail => (trim().isEmpty)
      ? "Please enter an email"
      : (!RegExp(emailRegx).hasMatch(trim()))
          ? "Please enter a valid email"
          : null;

  // //Validate Email...
  // String? get validatePhoneNumber => trim().isEmpty
  //     ? AlertMessageString.emptyPhoneNumber
  //     : trim().removeSpecialCharacters.length < 6
  //         ? AlertMessageString.validPhoneNumber
  //         : null;

  // //Validate Name...
  // String? get validateSubject =>
  //     trim().isEmpty ? AlertMessageString.emptySubject : null;

  // //Validate Name...
  // String? get validateQuestion =>
  //     trim().isEmpty ? AlertMessageString.emptyQuestion : null;

  // // Validate Password...
  // String? get validatePassword => trim().isEmpty
  //     ? AlertMessageString.emptyPwd
  //     : trim().length < 8
  //         ? AlertMessageString.validPassword
  //         : null;

  // // Validate Password...
  // String? get validateNewPassword => trim().isEmpty
  //     ? AlertMessageString.emptyPwd
  //     : trim().length < 8
  //         ? AlertMessageString.validPassword
  //         : null;

  // String? validateConfirmPassword(
  //     {required String newPass, required String confPass}) {
  //   if (confPass.trim().isEmpty) {
  //     return AlertMessageString.emptyPwd;
  //   } else if (newPass.trim() != confPass.trim()) {
  //     return AlertMessageString.doNotMatch;
  //   } else if (confPass.trim().length < 8) {
  //     return AlertMessageString.validPassword;
  //   } else {
  //     return null;
  //   }
  // }

  //Decode JWT Token...
  Map<String, dynamic> get getJsonFromJWT {
    try {
      if (isEmpty) {
        return {"exp": "0"};
      } else {
        String normalizedSource = base64Url.normalize(split(".")[1]);
        return json.decode(
          utf8.decode(
            base64Url.decode(normalizedSource),
          ),
        );
      }
    } catch (error) {
      //print("Error converting token data, $error");
      return {"exp": "0"};
    }
  }

  //Format Date with Required Format...
  String toDateFormat(
      {String incommingDateFormate = "yyyy-MM-dd HH:mm:ss",
      String requiredFormat = "MM/dd/yyyy hh:mm a",
      bool needToConvertToLocal = false}) {
    //! if date need to convert in to local. Date must requires in this formate(eg. "2021-01-01 00:00:00.000z")

    if (isEmpty) return this;

    DateFormat dateFormat = DateFormat(incommingDateFormate);

    try {
      if (needToConvertToLocal) {
        return DateFormat(requiredFormat)
            .format(DateTime.parse("${this}z").toLocal());
      } else {
        return DateFormat(requiredFormat)
            .format(dateFormat.parse(toString()).toLocal());
      }
    } catch (error) {
      //print(
      //"Please check incomming date format, format should be $incommingDateFormate:- $error");
      return this;
    }
  }
}

//Convert Date...
extension DateConversion on DateTime {
  // To Server Date...
  // DateTime get toUTCTimeZone =>
  //     DateTime.parse(DateFormat('yyyy-MM-dd HH:mm:ss').format(this));
}

bool isNullorEmpty(dynamic object) =>
    object == null || (object?.isEmpty ?? false);

extension ExtEnumName on Object {
  String get getEnumName => toString().split(".").last.replaceAll("_", " ");
}

extension ListEquality on List {
  bool isListEqual(List list) {
    if (length != list.length) return false;
    return every((item) => contains(item));
  }
}

extension GetDoubleValue on Object {
// Check Double...
  double get getAmountInDouble =>
      double.tryParse(toString().isEmpty ? "0" : toString()) ?? 0.0;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    try {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");

      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      } else {
        hexColor = hexColor;
      }

      return int.parse(hexColor, radix: 16);
    } catch (e) {
      return int.parse("55C67F", radix: 16);
    }
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension CapitalWord on String {
  /// String is in the format “aabbcc” or “ffaabbcc” with an optional leading “#”.
  String get capitalAllWords {
    return isEmpty
        ? ""
        : toLowerCase().split(' ').map((word) {
            String leftText =
                (word.length > 1) ? word.substring(1, word.length) : '';
            return word[0].toUpperCase() + leftText;
          }).join(' ');
  }
}

//Get File name...
extension FileExtention on File {
  String get name {
    return path.split("/").last;
  }

  Future<int> get fileSize async {
    return await length();
  }

  String get getFileSizeInMb {
    try {
      // Get length of file in bytes
      int fileSizeInBytes = lengthSync();

      // Convert the bytes to Kilobytes (1 KB = 1024 Bytes)
      double fileSizeInKB = fileSizeInBytes / 1024;

      // Convert the KB to MegaBytes (1 MB = 1024 KBytes)
      double fileSizeInMB = fileSizeInKB / 1024;

      return fileSizeInMB.toStringAsFixed(2);
    } catch (e) {
      return "0.0";
    }
  }
}
