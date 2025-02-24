// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/constants/constant_color.dart';
import 'package:wordles_multi_game_flutter/widgets/common_button.dart';

import '../../widgets/custom_text.dart';

enum SelectedColor {
  initial,
  absent,
  present,
  presentWrongPlace,
}

Color getColor(SelectedColor? state, bool isInKeyboard) {
  switch (state) {
    case SelectedColor.initial:
      if (isInKeyboard)
        return Colors.grey.shade400;
      else
        return ConstantColor.ffE4E4E7;
    case SelectedColor.absent:
      return ConstantColor.ffE4E4E7;
    case SelectedColor.present:
      return ConstantColor.ffA4F4CF;
    case SelectedColor.presentWrongPlace:
      return ConstantColor.ffFCDD88;
    default:
      if (isInKeyboard)
        return ConstantColor.ffffffff;
      else
        return Colors.grey.shade600;
  }
}

Color getFontColor(SelectedColor? state, bool isInKeyboard) {
  switch (state) {
    case SelectedColor.initial:
      if (isInKeyboard)
        return Colors.grey.shade400;
      else
        return ConstantColor.ff05000B;
    case SelectedColor.absent:
      return ConstantColor.ff05000B;
    case SelectedColor.present:
      return ConstantColor.ff00A63E;
    case SelectedColor.presentWrongPlace:
      return ConstantColor.ffBB4D00;
    default:
      if (isInKeyboard)
        return ConstantColor.ff05000B;
      else
        return Colors.grey.shade600;
  }
}

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    super.key,
    required this.onTextInput,
    required this.buttonColors,
    required this.onEnter,
    required this.onBackspace,
  });

  final String _firstRow = "qwertyuiop";
  final String _secondRow = 'asdfghjkl';
  final String _thirdRow = 'zxcvbnm';

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onEnter;

  final Map<String, SelectedColor> buttonColors;

  void _textInputHandler(String text) => onTextInput.call(text);

  void _backspaceHandler() => onBackspace.call();

  void _enterHandler(String text) => onEnter.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstantColor.ffF4F4F5,
      ),
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            buildRowOne(),
            buildRowTwo(),
            buildRowThree(),
            Gap(MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          for (var i in _firstRow.split(''))
            TextKey(
              color: getColor(buttonColors[i], true),
              fontColor: getFontColor(buttonColors[i], true),
              text: i,
              onTextInput: _textInputHandler,
            )
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          SizedBox(width: 15.w),
          for (var i in _secondRow.split(''))
            TextKey(
              color: getColor(buttonColors[i], true),
              fontColor: getFontColor(buttonColors[i], true),
              text: i,
              onTextInput: _textInputHandler,
            ),
          SizedBox(width: 15.w),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            color: ConstantColor.ff05000B,
            fontSize: 14,
            text: 'Enter',
            fontColor: ConstantColor.ffffffff,
            flex: 2,
            onTextInput: _enterHandler,
          ),
          for (var i in _thirdRow.split(''))
            TextKey(
              color: getColor(buttonColors[i], true),
              fontColor: getFontColor(buttonColors[i], true),
              text: i,
              onTextInput: _textInputHandler,
            ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    super.key,
    required this.text,
    required this.color,
    required this.onTextInput,
    this.fontColor,
    this.flex = 1,
    this.fontSize = 20,
    this.fontFamily,
  });

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;
  final Color color;
  final Color? fontColor;
  final double? fontSize;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: () {
          onTextInput(text);
        },
        child: Container(
          alignment: Alignment.center,
          height: 40.h,
          margin: EdgeInsets.all(2.h),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
            border: Border(
              bottom: BorderSide(
                color: ConstantColor.ff05000B.withValues(alpha: 0.20),
                width: 2,
              ),
            ),
          ),
          child: CustomText(
            txtTitle: text.toUpperCase(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: fontColor,
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    super.key,
    required this.onBackspace,
    this.flex = 1,
  });

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        height: 40.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: ConstantColor.ff05000B,
          borderRadius: BorderRadius.circular(8.r),
          border: Border(
            bottom: BorderSide(
              color: ConstantColor.ff05000B.withValues(alpha: 0.20),
              width: 2,
            ),
          ),
        ),
        child: InkWell(
          focusColor: Colors.black45,
          onTap: onBackspace,
          child: Icon(
            Icons.backspace_outlined,
            color: ConstantColor.ffffffff,
            size: 22.h,
          ),
        ),
      ),
    );
  }
}

Future<void> showEndGameDialog(BuildContext context, String properWord,
    void Function() restartGame) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Out of attempts'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('Good try! But we expected the word'),
              Text(properWord,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('Try again?'),
            ],
          ),
        ),
        actions: <Widget>[
          CommonButton(
            onTap: () {
              restartGame();
              Get.back();
            },
            title: "YES",
          ),
          CommonButton(
            onTap: () {
              Get.close(2);
            },
            title: "NO",
          ),
          // TextButton(
          //   child: const Text('That\'s enough'),
          //   onPressed: () {
          //     SystemNavigator.pop();
          //   },
          // ),
        ],
      );
    },
  );
}
