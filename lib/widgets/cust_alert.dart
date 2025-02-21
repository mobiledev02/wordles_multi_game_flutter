import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/alert_message_string.dart';
import '../constants/constant_color.dart';
import 'custom_text.dart';

custAlert({
  required BuildContext context,
  required String message,
  bool showDefaultError = false,
  String title = "Error",
  String leftButtonTitle = "OK",
  String rightButtonTitle = "OK",
  required Function() rightOnTap,
  bool singleButtonOnly = false,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 24.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomText(
                  txtTitle: title,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: CustomText(
                  align: TextAlign.center,
                  txtTitle:
                      AlertMessageString.getErrorMsg(
                          error: message, returnDefault: showDefaultError),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!singleButtonOnly)
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: CustomText(
                        txtTitle: leftButtonTitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                      rightOnTap();
                    },
                    child: CustomText(
                      txtTitle: rightButtonTitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ConstantColor.ffFB6169),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      });
}

// SnackbarController commonSnackBar({
//   required String msg,
//   required BuildContext context,
// }) {
//   // Get.closeAllSnackbars();
//   return Get.snackbar(
//     titleText: const SizedBox(),
//     margin: const EdgeInsets.symmetric(horizontal: 10),
//     borderRadius: 10,
//     messageText: Padding(
//       padding: const EdgeInsets.only(bottom: 9, left: 9, right: 9, top: 5),
//       child: CustomText(
//         align: TextAlign.center,
//         // textOverflow: TextOverflow.visible,
//         txtTitle: msg,
//         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//               fontWeight: FontWeight.w700,
//             ),
//       ),
//     ),
//     "",
//     '',
//     backgroundColor: Colors.white,
//     padding: EdgeInsets.zero,
//   );
// }
