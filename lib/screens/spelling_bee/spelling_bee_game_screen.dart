import 'package:flutter/material.dart';
import 'package:wordles_multi_game_flutter/constants/constant_color.dart';
import 'package:wordles_multi_game_flutter/constants/constant_string.dart';
import 'package:wordles_multi_game_flutter/widgets/common_button.dart';
import 'package:wordles_multi_game_flutter/widgets/common_widget.dart';
import 'package:wordles_multi_game_flutter/widgets/custom_text.dart';
import 'package:wordles_multi_game_flutter/widgets/pin_widget.dart';

class SpellingBeeScreen extends StatelessWidget {
  SpellingBeeScreen({super.key});

  List<String> wordList = ["Bee", "Honey"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: false,
        title: CustomText(
          txtTitle: ConstantString.spellingBeeTitle,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.black,
              ),
        ),
        actions: [
          CommonButton(
            onTap: () {},
            title: 'How to play',
            radius: 100,
          ),
        ],
      ),
      body: true
          ? CommonBackground(
              colors: [
                ConstantColor.ffFCDD88,
                Colors.white,
              ],
              child: Container(),
            )
          : Column(
              children: [
                _buildPinWidget(),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.white,
                )
              ],
            ),
    );
  }

  Widget _buildPinWidget() {
    return Container(
        height: 66,
        padding: EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: wordList
              .map((word) => PinWidget(
                    title: "Meet",
                    color: Colors.white.withAlpha(51),
                  ))
              .toList(),
        ));
  }
}
