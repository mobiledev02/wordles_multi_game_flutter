import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/constants/constant_color.dart';
import 'package:wordles_multi_game_flutter/constants/constant_image.dart';
import 'package:wordles_multi_game_flutter/widgets/cust_image.dart';

import '../../widgets/custom_text.dart';

class SpellingBeeGuideScreen extends StatelessWidget {
  const SpellingBeeGuideScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> howToPlay = [
      "Words must contain at least 4 letters.",
      "Words must include the center letter.",
      "Our word list does not include words that are obscure, hyphenated, or proper nouns.",
      "No cussing either, sorry.",
      "Letters can be used more than once."
    ];
    List<String> pointsList = [
      "4-letter words are worth 1 point each.",
      "Longer words earn 1 point per letter.",
      "Each puzzle includes at least one “pangram” which uses every letter. These are worth 7 extra points!"
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
                txtTitle: "How to Play Spelling Bee",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Gap(4.h),
              CustomText(
                txtTitle: "Create words using letters from the hive.",
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
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Opacity(
                            opacity: 0.2,
                            child: CustImage(
                              imgURL: ConstantImage.star,
                              height: 12.h,
                              width: 12.h,
                            ),
                          ),
                        ),
                        Gap(6.w),
                        Expanded(
                          child: CustomText(
                            txtTitle: howToPlay[index],
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
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
                txtTitle: "Score points to increase your rating.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Gap(10.h),
              ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Opacity(
                            opacity: 0.2,
                            child: CustImage(
                              imgURL: ConstantImage.star,
                              height: 12.h,
                              width: 12.h,
                            ),
                          ),
                        ),
                        Gap(6.w),
                        Expanded(
                          child: CustomText(
                            txtTitle: pointsList[index],
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
                  itemCount: pointsList.length),
              Gap(10.h),
            ],
          ),
        ),
      ],
    );
  }
}
