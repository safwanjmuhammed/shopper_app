import 'package:flutter/cupertino.dart';

class BasicText extends StatelessWidget {
  const BasicText({
    required this.text,
    super.key,
    this.textColor,
    this.maxLines,
    this.fontSize,
    this.textSpan,
    this.opacity,
    this.lineSpace,
    this.fontStyle,
    this.textAlign = TextAlign.start,
    this.fontWeight,
    this.textHeightBehavior,
    this.style,
  });

  final Color? textColor;
  final String text;
  final double? fontSize;
  final double? lineSpace;
  final double? opacity;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final List<InlineSpan>? textSpan;
  final TextHeightBehavior? textHeightBehavior;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RichText(
        textAlign: textAlign,
        maxLines: maxLines ?? 2,
        overflow: TextOverflow.ellipsis,
        textHeightBehavior: textHeightBehavior,
        text: TextSpan(
          text: text,
          style:
              style ??
              TextStyle(
                fontStyle: fontStyle,
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: '',
                height: lineSpace,
              ),
          children: textSpan,
        ),
      ),
    );
  }
}
