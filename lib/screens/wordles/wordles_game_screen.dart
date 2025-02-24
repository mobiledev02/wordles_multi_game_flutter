import 'dart:convert';

import "dart:math" as math;

import 'package:collection/src/list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/constants/constant_font.dart';
import 'package:wordles_multi_game_flutter/screens/wordles/controller/wordles_controller.dart';
import 'package:wordles_multi_game_flutter/screens/wordles/keyboard.dart';
import 'package:wordles_multi_game_flutter/utils/shared_preference.dart';
import 'package:wordles_multi_game_flutter/widgets/common_button.dart';
import 'package:wordles_multi_game_flutter/widgets/common_methods.dart';
import 'package:wordles_multi_game_flutter/widgets/common_widget.dart';
import 'package:wordles_multi_game_flutter/widgets/hint_button.dart';

import '../../constants/constant_color.dart';
import '../../widgets/custom_text.dart';
import 'guide_screen.dart';

class CrossWordGameScreen extends StatefulWidget {
  const CrossWordGameScreen({super.key});

  @override
  State<CrossWordGameScreen> createState() => _CrossWordGameScreenState();
}
//Game conditions

int wordSize = 5; //word is 5 letters only
int maxAttempts = 6; //impacts board size too

SelectedColor getSelectedState(
    List<String> secret, String input, int position) {
  //not enough to compare only current one, if there is several same letters
  // hints are not obvious
  if (secret[position] == input) {
    return SelectedColor.present;
  } else if (secret.contains(input)) {
    return SelectedColor.presentWrongPlace;
  } else {
    return SelectedColor.absent;
  }
}

class _CrossWordGameScreenState extends State<CrossWordGameScreen> {
  final WordlesController wordlesController = Get.find<WordlesController>();
  @override
  void initState() {
    super.initState();
    // initPlatformState();
    _readJson();
  }

  int _currentAttempt = 1;

  final List<String> _userInputs =
      List.filled(wordSize * maxAttempts, "", growable: false);
  final List<SelectedColor> _inputsState = List.filled(
      wordSize * maxAttempts, SelectedColor.initial,
      growable: false);

  final Map<String, SelectedColor> _keyboardKeysState = {};

  //dictionary and the keyword part
  late List<String> _dictionary;
  late String _secret;

  Future<void> _readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/dictionary.json');
    final data = await json.decode(response);
    _dictionary = List<String>.from(data);
    _secret = _dictionary[math.Random().nextInt(_dictionary.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: commonAppBar(
          context: context,
          fontSize: 18,
          title: "Wordles",
          actions: [
            _buildHintButton(context),
            Gap(7.w),
            CommonButton(
              radius: 100,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: GuideScreen(),
                      );
                    });
              },
              title: "How To Play",
            )
          ],
        ),
        body: CommonBackground(
          colors: [ConstantColor.ff8E51FF, Colors.white],
          child: Column(
            children: [
              _buildLatterGride(context),
              _buildKeyboard(),
            ],
          ),
        ));
  }

  Widget _buildKeyboard() {
    return GetBuilder<WordlesController>(
        id: wordlesController.updateLatter,
        builder: (controller) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: CustomKeyboard(
              buttonColors: _keyboardKeysState,
              onTextInput: (myText) {
                _insertLetter(myText);
              },
              onEnter: _enter,
              onBackspace: _backspace,
            ),
          );
        });
  }

  Widget _buildLatterGride(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: isIpadDevice ? 280.w : Get.width,
        child: GetBuilder<WordlesController>(
            id: wordlesController.updateLatter,
            builder: (controller) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(30.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: wordSize,
                  ),
                  itemCount: _userInputs.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      transform: Matrix4.skewY(
                          _inputsState[index] == SelectedColor.initial
                              ? 0
                              : math.pi),
                      decoration: BoxDecoration(
                        color: getColor(_inputsState[index], false),
                        borderRadius: BorderRadius.circular(15),
                        border: Border(
                          bottom: BorderSide(
                            color:
                                ConstantColor.ff9B62FD.withValues(alpha: 0.25),
                            width: 4,
                          ),
                          right: BorderSide(
                            color:
                                ConstantColor.ff9B62FD.withValues(alpha: 0.25),
                            width: 4,
                          ),
                        ),
                      ),
                      child: CustomText(
                        txtTitle: _userInputs[index].toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 32,
                              color: getFontColor(_inputsState[index], false),
                              fontFamily: ConstantFont.moonchild,
                            ),
                      ),
                    );
                  });
            }),
      ),
    );
  }

  Widget _buildHintButton(BuildContext context) {
    return GetBuilder<WordlesController>(
      id: wordlesController.updateHint,
      builder: (controller) {
        return HintButton(
            hintCount: SharedPreferencesHelper.getWordlesHint(),
            onTap: () {
              if (SharedPreferencesHelper.getWordlesHint() > 0) {
                int hint = (math.Random()).nextInt(5);
                commonToast(
                  message:
                      "${hint + 1} letter is \"${_secret.characters.characterAt(hint).toUpperCase()}\". Hope it helps!",
                );

                SharedPreferencesHelper.setWordlesHint(
                    hintCount: SharedPreferencesHelper.getWordlesHint() - 1);
              }
            });
      },
    );
  }

  void _insertLetter(String letter) {
    HapticFeedback.mediumImpact();
    SystemSound.play(SystemSoundType.click);
    int replace = _userInputs.indexWhere((o) => o.isEmpty);

    if (replace < _currentAttempt * wordSize) {
      _userInputs[replace] = letter;
    }
    wordlesController.updateLatterBuilder();
    debugPrint('_insertText: $letter');
    debugPrint('secret: $_secret');
  }

  void _enter() {
    HapticFeedback.mediumImpact();
    SystemSound.play(SystemSoundType.click);
    var result = _userInputs
        .sublist((_currentAttempt - 1) * wordSize, _currentAttempt * wordSize)
        .join()
        .toLowerCase();
    //validate input
    if (!_dictionary.contains(result)) {
      //validation failed
      commonToast(
        message:
            "No such word in dictionary 😔. Each attempt must be a valid 5-letter English word📝.",
      );
    } else {
      result.split('').forEachIndexed((index, element) {
        _inputsState[(_currentAttempt - 1) * wordSize + index] =
            getSelectedState(_secret.split(''), element, index);
      });

      wordlesController.updateLatterBuilder();
      if (result != _secret) {
        //didn't get the word
        if (_currentAttempt == maxAttempts) {
          //last attempt failed
          showEndGameDialog(context, _secret, _restartGame);
        } else {
          //game goes on, provide visual clues

          _currentAttempt++;
          result.split('').forEachIndexed((index, element) {
            _keyboardKeysState[result[index]] =
                getSelectedState(_secret.split(''), element, index);
            wordlesController.updateLatterBuilder();
          });
        }
      } else {
        commonToast(
          message: "Congrats! You won 🎉",
        );

        _restartGame();
        debugPrint('you won');
      }
    }
  }

  void _backspace() {
    HapticFeedback.mediumImpact();
    SystemSound.play(SystemSoundType.click);
    var index = _userInputs.lastIndexWhere((o) => o.isNotEmpty);
    if (index >= (_currentAttempt - 1) * wordSize) {
      _userInputs[index] = "";
      wordlesController.updateLatterBuilder();
    }
  }

  void _restartGame() {
    _userInputs.forEachIndexed((index, item) => _userInputs[index] = "");
    _inputsState.forEachIndexed(
        (index, item) => _inputsState[index] = SelectedColor.initial);
    _keyboardKeysState.clear();
    _currentAttempt = 1;
    _readJson();
    wordlesController.updateLatterBuilder();
  }
}
