import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/kit/theme.dart';

class Tag extends StatelessWidget {
  const Tag(
    this.text, {
    Key? key,
    this.padding,
    this.color = Colors.black,
    this.backgroundColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  /// 文本
  final String text;

  /// 内边距
  final EdgeInsets? padding;

  /// 颜色
  /// 背景颜色 color.withOpacity(.46)
  final Color? color;

  /// borderRadius
  final BorderRadius? borderRadius;

  /// fontSize
  final double? fontSize;

  /// 背景颜色
  final Color? backgroundColor;

  /// fontWeight
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 4,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? color?.withOpacity(.25),
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? WcaoTheme.fsSm,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
