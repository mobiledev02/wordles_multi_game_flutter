import 'package:wordles_multi_game_flutter/utils/custom_extension.dart';

import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      this.title = "",
      this.normalTextStyle,
      this.fancyTextStyle,
      this.onTap,
      this.textAlign = TextAlign.left,
      this.maxLines = 2});
  final String title;
  final void Function(String)? onTap;
  final TextStyle? fancyTextStyle;
  final TextStyle? normalTextStyle;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return RichText(
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: true,
      text: TextSpan(
        style: theme.bodyMedium,
        children: title.processCaption(
          matcher: "#",
          normalTextStyle: normalTextStyle ?? theme.bodyLarge,
          fancyTextStyle: fancyTextStyle ??
              theme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
          onTap: onTap ??
              (text) {
                debugPrint(text);
              },
        ),
      ),
    );
  }
}
