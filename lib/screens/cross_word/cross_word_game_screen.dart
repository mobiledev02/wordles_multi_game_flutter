import 'dart:convert';
import "dart:math" as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/constants/constant_font.dart';
import 'package:wordles_multi_game_flutter/screens/cross_word/widgets.dart';
import 'dart:developer';
import 'package:collection/src/list_extensions.dart';
import 'package:wordles_multi_game_flutter/widgets/common_button.dart';
import 'package:wordles_multi_game_flutter/widgets/common_widget.dart';

import '../../constants/constant_color.dart';
import '../../widgets/custom_text.dart';
import 'guide.dart';

class CrossWordGameScreen extends StatefulWidget {
  const CrossWordGameScreen({super.key});

  @override
  State<CrossWordGameScreen> createState() => _CrossWordGameScreenState();
}
//Game conditions

int wordSize = 5; //word is 5 letters only
int maxAttempts = 5; //impacts board size too

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
          title: "The Crosswords",
          actions: [
            CommonButton(
              radius: 100,
              onTap: () {
                int hint = (math.Random()).nextInt(5);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: CustomText(
                    txtTitle:
                        "${hint + 1} letter is \"${_secret.characters.characterAt(hint).toUpperCase()}\". Hope it helps! $_secret",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(),
                  )),
                );
              },
              title: "Hint",
            ),
            CommonButton(
              radius: 100,
              onTap: () {
                Get.to(GuideRoute());
              },
              title: "How To Play",
            )
          ],
        ),
        body: CommonBackground(
          colors: [
            ConstantColor.ff8E51FF,
            Colors.white,
          ],
          child: Column(
            children: [
              Expanded(
                  child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: wordSize),
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
                              color: ConstantColor.ff9B62FD
                                  .withValues(alpha: 0.25),
                              width: 4,
                            ),
                            right: BorderSide(
                              color: ConstantColor.ff9B62FD
                                  .withValues(alpha: 0.25),
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
                    }),
              )),
              CommonButton(onTap: _restartGame, title: "Try another word"),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomKeyboard(
                  buttonColors: _keyboardKeysState,
                  onTextInput: (myText) {
                    _insertLetter(myText);
                  },
                  onEnter: _enter,
                  onBackspace: _backspace,
                ),
              ),
            ],
          ),
        ));
  }

  void _insertLetter(String letter) {
    HapticFeedback.mediumImpact();
    SystemSound.play(SystemSoundType.click);
    int replace = _userInputs.indexWhere((o) => o.isEmpty);
    setState(() {
      if (replace < _currentAttempt * wordSize) {
        _userInputs[replace] = letter;
      }
    });
    log('_insertText: $letter');
    log('secret: $_secret');
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

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CustomText(
          txtTitle:
              "No such word in dictionary 😔. Each attempt must be a valid 5-letter English word📝.",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(),
        ),
      ));
    } else {
      setState(() {
        result.split('').forEachIndexed((index, element) {
          _inputsState[(_currentAttempt - 1) * wordSize + index] =
              getSelectedState(_secret.split(''), element, index);
        });
      });
      if (result != _secret) {
        //didn't get the word
        if (_currentAttempt == maxAttempts) {
          //last attempt failed
          showEndGameDialog(context, _secret, _restartGame);
        } else {
          //game goes on, provide visual clues
          setState(() {
            _currentAttempt++;
            for (var i in result.split('')) {
              if (!_secret.split('').contains(i)) {
                log('highlighting $i item');
                _keyboardKeysState[i] = SelectedColor.absent;
              }
            }
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              txtTitle: "Congrats! You won 🎉",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(),
            ),
          ),
        );
        _restartGame();
        log('you won');
        _requestReview();
      }
    }
  }

  void _backspace() {
    HapticFeedback.mediumImpact();
    SystemSound.play(SystemSoundType.click);
    var index = _userInputs.lastIndexWhere((o) => o.isNotEmpty);
    if (index >= (_currentAttempt - 1) * wordSize) {
      setState(() {
        _userInputs[index] = "";
      });
    }
  }

  Future<void> _requestReview() async {
    log('trying to request a review');
    // if (await inAppReview.isAvailable()) {
    //   inAppReview.requestReview();
    // }
  }

  void _restartGame() {
    setState(() {
      _userInputs.forEachIndexed((index, item) => _userInputs[index] = "");
      _inputsState.forEachIndexed(
          (index, item) => _inputsState[index] = SelectedColor.initial);
      _keyboardKeysState.clear();
      _currentAttempt = 1;
      _readJson();
    });
  }
}



  // Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     //Center Row contents horizontally,
  //     children: [
  //       ElevatedButton.icon(
  //         style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.blueGrey),
  //         icon: const Text('Get a Hint'),
  //         label: const Icon(Icons.chat_bubble),
  //         onPressed: () {
  //           int hint = (math.Random()).nextInt(5);
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             content: Text(
  //                 "${hint + 1} letter is \"${_secret.characters.characterAt(hint).toUpperCase()}\". Hope it helps!"),
  //           ));
  //         },
  //       ),
  //     ]),