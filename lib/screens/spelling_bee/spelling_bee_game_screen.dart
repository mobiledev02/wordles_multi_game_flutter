import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/screens/spelling_bee/spelling_bee_guide_screen.dart';

import '/constants/constant_color.dart';
import '/constants/constant_font.dart';
import '/constants/constant_image.dart';
import '/constants/constant_string.dart';
import '/screens/spelling_bee/controller/spelling_bee_controller.dart';
import '/widgets/common_button.dart';
import '/widgets/common_widget.dart';
import '/widgets/cust_inkwell.dart';
import '/widgets/pin_widget.dart';
import '../../utils/shared_preference.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/hint_button.dart';
import 'models/spelling_bee_model.dart';

class SpellingBeeScreen extends StatefulWidget {
  const SpellingBeeScreen({super.key});

  @override
  State<SpellingBeeScreen> createState() => _SpellingBeeScreenState();
}

class _SpellingBeeScreenState extends State<SpellingBeeScreen>
    with SingleTickerProviderStateMixin {
  final SpellingBeeController spellingBeeController =
      Get.find<SpellingBeeController>();
  RxString word = "".obs;
  late SpellingBeeModel spellingBeeModel;
  late AnimationController _controller;
  late Animation<double> _animation;
  RxList<String> wordList = <String>[].obs;
  RxString showToShortLabel = "".obs;

  RxInt totalSteps = 0.obs;
  RxInt activeStep = (-1).obs;
  double totalWidth = Get.width - 140.w;

  @override
  void initState() {
    spellingBeeModel = spellingBeeList.first;
    totalSteps.value = spellingBeeModel.spellingList.length;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 0), weight: 1),
    ]).animate(_controller);

    super.initState();
  }

  void startShake(String title) {
    showToShortLabel.value = title;
    _controller.forward(from: 0);
  }

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
                      child: SpellingBeeGuideScreen(),
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
            _buildProgressBar(context),
            _buildPinWidget(),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.white,
            ),
            Obx(() {
              return showToShortLabel.isNotEmpty
                  ? AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_animation.value,
                              0), // Shake in horizontal direction
                          child: child,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                            color:
                                ConstantColor.ff05000B.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: CustomText(
                          txtTitle: showToShortLabel.value,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: ConstantColor.ffffffff,
                                  ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 31 + 5.h,
                    );
            }),
            _buildTypedWord(),
            SizedBox(
              width: 300.h,
              height: 300.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  buildHexagon(spellingBeeModel.letters[0], -40, -70),
                  buildHexagon(spellingBeeModel.letters[1], 40, -70),
                  buildHexagon(spellingBeeModel.letters[2], -80, 0),
                  buildHexagon(spellingBeeModel.letters[3], 80, 0),
                  buildHexagon(spellingBeeModel.letters[4], -40, 70),
                  buildHexagon(spellingBeeModel.letters[5], 40, 70),
                  buildHexagon(spellingBeeModel.centerLetter, 0, 0,
                      isCenter: true),
                ],
              ),
            ),
            _buildDeleteRefreshAndEnterButton()
          ],
        ),
      ),
    );
  }

  Widget _buildTypedWord() {
    return Obx(() {
      return RichText(
        text: TextSpan(
          children: word.value.isEmpty
              ? [
                  TextSpan(
                    text: " ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: ConstantColor.ff05000B,
                      fontFamily: ConstantFont.moonchild,
                    ),
                  )
                ]
              : word.value.split('').map(
                  (char) {
                    return TextSpan(
                      text: char,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: char == spellingBeeController.centerLetter
                            ? ConstantColor.ff8E51FF
                            : ConstantColor.ff05000B,
                        fontFamily: ConstantFont.moonchild,
                      ),
                    );
                  },
                ).toList(),
        ),
      );
    });
  }

  Widget _buildDeleteRefreshAndEnterButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonButton(
          onTap: () {
            if (word.value.isNotEmpty) {
              word.value = word.value.substring(0, word.value.length - 1);
            }
          },
          title: "Delete",
          radius: 40,
        ),
        Gap(10.w),
        CommonIconButton(
          bgColor: ConstantColor.ffffffff,
          image: ConstantImage.refresh,
          onTap: () {
            spellingBeeModel.letters.shuffle();
            if (mounted) {
              setState(() {});
            }
          },
        ),
        Gap(10.w),
        CommonButton(
          onTap: () {
            if (word.isNotEmpty) {
              if (word.value.length < 4) {
                startShake("Too short");
                Future.delayed(Duration(milliseconds: 500), () {
                  word.value = "";
                  showToShortLabel.value = "";
                });
              } else {
                if (spellingBeeModel.spellingList.contains(word.value)) {
                  wordList.add(word.value);
                  word.value = "";
                } else {
                  startShake("Invalid word");
                  Future.delayed(Duration(milliseconds: 500), () {
                    word.value = "";
                    showToShortLabel.value = "";
                  });
                }
              }
              activeStep.value = wordList.length - 1;
            }
          },
          title: "Enter",
          radius: 40,
        ),
      ],
    );
  }

  Widget buildHexagon(String letter, double offsetX, double offsetY,
      {bool isCenter = false}) {
    return Positioned(
      left: 120.w + offsetX,
      top: 120.h + offsetY,
      child: CustomInkWell(
        onTap: () {
          word.value += letter;
        },
        child: SizedBox(
          width: 70.h,
          height: 70.h,
          child: ClipPolygon(
            sides: 6,
            borderRadius: 5.0,
            rotate: 60.0,
            boxShadows: [
              PolygonBoxShadow(color: Colors.black, elevation: 1.0),
              PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
            ],
            child: Container(
              decoration: BoxDecoration(
                color:
                    isCenter ? ConstantColor.ff8E51FF : ConstantColor.ffffffff,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: CustomText(
                txtTitle: letter,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: isCenter ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: ConstantFont.moonchild,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              txtTitle: "Good",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Gap(8.w),
            ...List.generate(
              totalSteps.value,
              (index) => buildStep(
                isActive: index <= activeStep.value,
                lineWidth: (totalWidth - (totalSteps.value * 10.w)) /
                    (totalSteps.value - 1), // Dynamic line width
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildStep({required bool isActive, required double lineWidth}) {
    return Row(
      children: [
        Container(
          width: lineWidth,
          height: 2,
          color: isActive ? Colors.orange : Colors.grey[300],
        ),
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey[400],
            shape: BoxShape.circle,
          ),
        ),
      ],
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
    return Obx(() {
      return Container(
        height: 66.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.5),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          // reverse: true,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: wordList.length,
          itemBuilder: (context, index) => PinWidget(
            title: wordList[index],
            color: Colors.white.withValues(alpha: 0.5),
          ),
          separatorBuilder: (context, index) => Gap(10.w),
        ),
      );
    });
  }
}
