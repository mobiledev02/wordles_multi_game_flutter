// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wordles_multi_game_flutter/constants/constant_color.dart';

enum SelectedColor {
  initial,
  absent,
  present,
  presentWrongPlace,
}

Color getColor(SelectedColor? state, bool isInKeyboard) {
  switch (state) {
    case SelectedColor.initial:
      if (!isInKeyboard)
        return ConstantColor.ffE4E4E7;
      else
        return Colors.grey.shade400;
    case SelectedColor.absent:
      return ConstantColor.ffE4E4E7;
    case SelectedColor.present:
      return ConstantColor.ffA4F4CF;
    case SelectedColor.presentWrongPlace:
      return ConstantColor.ffFCDD88;
    default:
      if (!isInKeyboard)
        return Colors.grey.shade600;
      else
        return Colors.grey;
  }
}

Color getFontColor(SelectedColor? state, bool isInKeyboard) {
  switch (state) {
    case SelectedColor.initial:
      if (!isInKeyboard)
        return ConstantColor.ff05000B;
      else
        return Colors.grey.shade400;
    case SelectedColor.absent:
      return ConstantColor.ff05000B;
    case SelectedColor.present:
      return ConstantColor.ff00A63E;
    case SelectedColor.presentWrongPlace:
      return ConstantColor.ffBB4D00;
    default:
      if (!isInKeyboard)
        return Colors.grey.shade600;
      else
        return Colors.grey;
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
      height: 200,
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
          const SizedBox(width: 15),
          for (var i in _secondRow.split(''))
            TextKey(
              color: getColor(buttonColors[i], true),
              text: i,
              onTextInput: _textInputHandler,
            ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            color: const Color(0xffff914d),
            text: 'Enter',
            flex: 2,
            onTextInput: _enterHandler,
          ),
          for (var i in _thirdRow.split(''))
            TextKey(
              color: getColor(buttonColors[i], true),
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
    this.flex = 1,
  });

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SizedBox(
          height: 48,
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: color,
            child: InkWell(
              focusColor: Colors.black45,
              child: Align(
                alignment: Alignment.center,
                child: Text(text.toUpperCase(), textAlign: TextAlign.center),
              ),
              onTap: () {
                onTextInput(text);
              },
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
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SizedBox(
          height: 48,
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white54,
            child: InkWell(
              focusColor: Colors.black45,
              onTap: onBackspace,
              child: const Align(
                alignment: Alignment.center,
                child: Icon(Icons.backspace),
              ),
            ),
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
          TextButton(
            child: const Text('YES'),
            onPressed: () {
              restartGame();
            },
          ),
          TextButton(
            child: const Text('That\'s enough'),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      );
    },
  );
}
