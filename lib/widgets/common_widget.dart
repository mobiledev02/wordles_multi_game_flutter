import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../constants/constant_image.dart';
import 'custom_text.dart';

AppBar commonAppBar({
  required BuildContext context,
  double? leadingWidth,
  required String title,
  List<Widget>? actions,
  double? fontSize,
}) {
  return AppBar(
    toolbarHeight: 46.h,
    leadingWidth: leadingWidth ?? 30,
    centerTitle: false,
    title: CustomText(
      txtTitle: title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.w700, fontSize: fontSize),
    ),
    actions: actions == null
        ? []
        : [
            ...actions,
            Gap(16.w),
          ],
  );
}

class CommonBackground extends StatelessWidget {
  final List<Color> colors;
  final Widget child;
  const CommonBackground(
      {super.key, required this.colors, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        image: DecorationImage(
          image: AssetImage(
            ConstantImage.dot,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
