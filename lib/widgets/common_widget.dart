import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'custom_text.dart';

AppBar commonAppBar({
  required BuildContext context,
  double? leadingWidth,
  required String title,
  List<Widget>? actions,
  double? fontSize,
}) {
  return AppBar(
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
