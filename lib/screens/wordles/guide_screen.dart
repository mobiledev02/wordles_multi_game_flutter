import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/constants/constant_color.dart';
import 'package:wordles_multi_game_flutter/constants/constant_image.dart';
import 'package:wordles_multi_game_flutter/widgets/cust_image.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/rich_text.dart';
import 'keyboard.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> howToPlay = [
      "Guess the Wordle in 6 tries.",
      "The color of the tiles will change to show how close your guess was to the word.",
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txtTitle: "How To Play The Wordle",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Gap(4.h),
              CustomText(
                txtTitle: "Guess the Wordle in 6 tries.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ConstantColor.ff71717B,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Gap(10.h),
              Divider(
                color: ConstantColor.ff05000B.withValues(alpha: 0.1),
              ),
              Gap(10.h),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: CustImage(
                            imgURL: ConstantImage.star,
                            height: 12.h,
                            width: 12.h,
                          ),
                        ),
                        Gap(6.w),
                        Expanded(
                          child: CustomText(
                            txtTitle: howToPlay[index],
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Gap(10.h),
                  itemCount: howToPlay.length),
              Gap(10.h),
              Divider(
                color: ConstantColor.ff05000B.withValues(alpha: 0.1),
              ),
              Gap(10.h),
              CustomText(
                txtTitle: "Example",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Gap(10.h),
              Row(
                children: [
                  for (var i in "wrong".split(''))
                    TextKey(
                      color: (i == "w")
                          ? ConstantColor.ffA4F4CF
                          : ConstantColor.ff05000B.withValues(alpha: 0.04),
                      fontColor: getFontColor(
                          (i == "w")
                              ? SelectedColor.present
                              : SelectedColor.initial,
                          false),
                      text: i,
                      onTextInput: (myText) {},
                    ),
                ],
              ),
              Gap(10.h),
              CustomRichText(
                title: "The letter #W is in the word and in the correct spot.",
                normalTextStyle:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ConstantColor.ff05000B,
                        ),
              ),
              Gap(10.h),
              Row(
                children: [
                  for (var i in "light".split(''))
                    TextKey(
                      color: (i == "i")
                          ? ConstantColor.ffFCDD88
                          : ConstantColor.ff05000B.withValues(alpha: 0.04),
                      fontColor: getFontColor(
                          (i == "i")
                              ? SelectedColor.presentWrongPlace
                              : SelectedColor.initial,
                          false),
                      text: i,
                      onTextInput: (myText) {},
                    ),
                ],
              ),
              Gap(10.h),
              CustomRichText(
                title: "The letter #I is in the word but in the wrong spot.",
                normalTextStyle:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ConstantColor.ff05000B,
                        ),
              ),
              Gap(10.h),
              Row(
                children: [
                  for (var i in "vague".split(''))
                    TextKey(
                      text: i,
                      color: (i == "u")
                          ? ConstantColor.ffE4E4E7
                          : ConstantColor.ff05000B.withValues(alpha: 0.04),
                      fontColor: getFontColor(
                          (i == "w")
                              ? SelectedColor.absent
                              : SelectedColor.initial,
                          false),
                      // fontFamily: ConstantFont.moonchild,
                      onTextInput: (myText) {},
                    ),
                ],
              ),
              Gap(10.h),
              CustomRichText(
                title: "The letter #U is not in the word in any spot.",
                normalTextStyle:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ConstantColor.ff05000B,
                        ),
              ),
              Gap(10.h),
            ],
          ),
        ),
      ],
    );
  }
}
