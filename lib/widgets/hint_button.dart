import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant_color.dart';
import '../constants/constant_image.dart';

import 'common_button.dart';
import 'custom_text.dart';

class HintButton extends StatelessWidget {
  const HintButton({
    super.key,
    required this.hintCount,
    required this.onTap,
  });
  final int hintCount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 3.w,
            top: 3.h,
          ),
          child: CommonIconButton(
            bgColor: ConstantColor.ffFCDD88,
            image: ConstantImage.hint,
            height: 36,
            width: 36,
            onTap: onTap,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            alignment: Alignment.center,
            height: 14.h,
            width: 14.h,
            decoration: BoxDecoration(
              color: hintCount == 0 ? Colors.red : ConstantColor.ff05000B,
              shape: BoxShape.circle,
            ),
            child: CustomText(
              txtTitle: hintCount == 0 ? "AD" : hintCount.toString(),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: ConstantColor.ffffffff,
                    fontSize: hintCount == 0 ? 8 : 12,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
