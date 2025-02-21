import 'package:flutter/material.dart';
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
        vertical: 10,
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          100,
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
