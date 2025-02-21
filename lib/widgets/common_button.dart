import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
