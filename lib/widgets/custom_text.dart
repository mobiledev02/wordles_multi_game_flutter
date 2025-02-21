import 'package:flutter/material.dart';

import 'common_methods.dart';

class CustomText extends StatelessWidget {
  final String? txtTitle;
  final TextStyle? style;
  final TextAlign? align;
  final Alignment? btnTextAlignment;
  final int? maxLine;
  final bool showOriginalText;
  final TextOverflow? textOverflow;
  final void Function()? onPressed;

  const CustomText({
    super.key,
    this.txtTitle,
    this.style,
    this.align = TextAlign.start,
    this.maxLine,
    this.showOriginalText = false,
    this.textOverflow,
    this.onPressed,
    this.btnTextAlignment,
  });

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      showOriginalText
          ? txtTitle ?? ""
          : txtTitle ?? "",
      style: style,
      softWrap: true,
      textAlign: align,
      maxLines: maxLine,
      overflow: textOverflow,
      textScaler: TextScaler.linear(isIpadDevice ? 1.5 : 1.0),
    );
    return onPressed == null
        ? textWidget
        : TextButton(
            onPressed: onPressed,
            child: textWidget,
          );
  }
}
