import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '/constants/constant_color.dart';

bool get isIpadDevice => Device.get().isTablet;

void commonUrlLauncher(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    debugPrint('Could not launch $url');
  }
}

// Future<bool> checkInternatConnection() async {
//   List<ConnectivityResult> connectivityResult =
//       await (Connectivity().checkConnectivity());
//   if (connectivityResult.isEmpty) {
//     return false;
//   }

//   return (connectivityResult[0] == ConnectivityResult.mobile ||
//       connectivityResult[0] == ConnectivityResult.wifi);
// }

Color getSliderColor(double value) {
  // List of colors to cycle through
  List<Color> colors = [
    const Color(0xffF32E7C),
    const Color(0xffF32E7C),
    const Color(0xffF32E7C),
    const Color(0xffF32E7C),
    const Color(0xffF32F7C),
    const Color(0xffF4317B),
    const Color(0xffF4337A),
    const Color(0xffF4337A),
    const Color(0xffF4347A),
    const Color(0xffF4357A),
    const Color(0xffF4357A),
    const Color(0xffF43679),
    const Color(0xffF43679),
    const Color(0xffF53779),
    const Color(0xffF53878),
    const Color(0xffF53978),
    const Color(0xffF53978),
    const Color(0xffF53A78),
    const Color(0xffF53A78),
    const Color(0xffF53B77),
    const Color(0xffF53B77),
    const Color(0xffF53C77),
    const Color(0xffF53C77),
    const Color(0xffF63D77),
    const Color(0xffF63D77),
    const Color(0xffF63E76),
    const Color(0xffF63E76),
    const Color(0xffF63F76),
    const Color(0xffF64076),
    const Color(0xffF64075),
    const Color(0xffF64275),
    const Color(0xffF64275),
    const Color(0xffF74374),
    const Color(0xffF74574),
    const Color(0xffF74673),
    const Color(0xffF74773),
    const Color(0xffF74873),
    const Color(0xffF74972),
    const Color(0xffF84A72),
    const Color(0xffF84B72),
    const Color(0xffF84C71),
    const Color(0xffF84D71),
    const Color(0xffF84E71),
    const Color(0xffF84E71),
    const Color(0xffF84F70),
    const Color(0xffF9566E),
    const Color(0xffF95170),
    const Color(0xffF9526F),
    const Color(0xffF9526F),
    const Color(0xffF9546F),
    const Color(0xffF9556E),
    const Color(0xffFA566E),
    const Color(0xffFA586D),
    const Color(0xffFA596D),
    const Color(0xffFA5C6C),
  ];

  int index = ((value ~/ 2) - 1) % colors.length;
  return colors[index];
}

Future<bool?> commonToast(
    {required String message, int timeInSecForIosWeb = 3}) {
  return Fluttertoast.showToast(
    gravity: ToastGravity.BOTTOM,
    msg: message,
    timeInSecForIosWeb: timeInSecForIosWeb,
    backgroundColor: ConstantColor.ff05000B,
  );
}
