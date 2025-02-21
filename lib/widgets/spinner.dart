import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';


class Spinner extends StatelessWidget {
  const Spinner({
    super.key,
    this.progressColor,
    this.spinnerSize = const ui.Size(50.0, 50.0),
  });
  final Color? progressColor;
  final ui.Size spinnerSize;

  @override
  Widget build(BuildContext context) {
    // By default circular progress indicator takes ascent color...
    return Center(
      child: SizedBox(
        height: spinnerSize.height,
        width: spinnerSize.height,
        child: CircularProgressIndicator(
          color: progressColor ,
          strokeWidth: 3.0.h,
        ),
      ),
    );
  }
}
