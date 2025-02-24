import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wordles_multi_game_flutter/widgets/custom_text.dart';

class PinWidget extends StatelessWidget {
  final String title;
  final double borderRadius;
  final Color color;
  const PinWidget({
    super.key,
    required this.title,
    this.borderRadius = 100,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 14.w,
      ),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          100.r,
        ),
      ),
      child: CustomText(
        txtTitle: title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
