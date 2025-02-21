import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../constants/constant_color.dart';
import 'cust_image.dart';
import 'cust_inkwell.dart';
import 'custom_text.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onTap,
    required this.title,
    this.radius = 10,
    this.padding,
  });

  final String title;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: ConstantColor.ff05000B,
          borderRadius: BorderRadius.circular(radius.r),
        ),
        child: CustomText(
          txtTitle: title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ConstantColor.ffffffff,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}

class CommonBorderButton extends StatelessWidget {
  const CommonBorderButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border(
            bottom: BorderSide(
              color: ConstantColor.ff05000B.withValues(alpha: 0.3),
              width: 4,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: ConstantColor.ff05000B,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: ConstantColor.ffffffff,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.play_arrow,
                color: ConstantColor.ffffffff,
              ),
              Gap(10.w),
              CustomText(
                txtTitle: title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ConstantColor.ffffffff,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonIconButton extends StatelessWidget {
  const CommonIconButton({
    super.key,
    required this.image,
    required this.onTap,
  });
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 40.h,
        decoration: BoxDecoration(
          color: ConstantColor.ffF3F4F6,
          shape: BoxShape.circle,
        ),
        child: CustImage(
          height: 24.h,
          width: 24.h,
          imgURL: image,
        ),
      ),
    );
  }
}
