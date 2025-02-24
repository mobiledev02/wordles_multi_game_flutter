import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '/constants/constant_color.dart';
import '/constants/constant_string.dart';
import '/screens/spelling_bee/controller/spelling_bee_controller.dart';
import '/widgets/common_button.dart';
import '/widgets/common_widget.dart';
import '/widgets/pin_widget.dart';
import '../../utils/shared_preference.dart';
import '../../widgets/hint_button.dart';
import '../wordles/controller/wordles_controller.dart';
import '../wordles/guide_screen.dart';

class SpellingBeeScreen extends StatelessWidget {
  SpellingBeeScreen({super.key});
  final SpellingBeeController spellingBeeController =
      Get.find<SpellingBeeController>();

  final List<String> wordList = [
    "Bee",
    "Honey",
    "Bee",
    "Honey",
    "Bee",
    "Honey",
    "Bee",
    "Honey",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow,
      appBar: commonAppBar(
        context: context,
        fontSize: 18,
        title: ConstantString.spellingBeeTitle,
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
        colors: [
          ConstantColor.ffFCDD88,
          Colors.white,
        ],
        child: Column(
          children: [
            _buildPinWidget(),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHintButton(BuildContext context) {
    return GetBuilder<SpellingBeeController>(
      id: spellingBeeController.updateHint,
      builder: (controller) {
        return HintButton(
            hintCount: SharedPreferencesHelper.getSpellingBeeHint(),
            onTap: () {
              if (SharedPreferencesHelper.getSpellingBeeHint() > 0) {
                // int hint = (math.Random()).nextInt(5);
                // commonToast(
                //   message:
                //       "${hint + 1} letter is \"${_secret.characters.characterAt(hint).toUpperCase()}\". Hope it helps!",
                // );

                SharedPreferencesHelper.setSpellingBeeHint(
                  hintCount: SharedPreferencesHelper.getSpellingBeeHint() - 1,
                );
              }
            });
      },
    );
  }

  Widget _buildPinWidget() {
    return Container(
      height: 66.h,
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        reverse: true,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: wordList.length,
        itemBuilder: (context, index) => PinWidget(
          title: wordList[index],
          color: Colors.white.withAlpha(51),
        ),
        separatorBuilder: (context, index) => Gap(16.w),
      ),
    );
  }
}
