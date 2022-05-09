import 'package:flutter/material.dart';
import 'package:flutter_dating_template/utils/theme.dart';

class Tag extends StatelessWidget {
  const Tag(
    this.text, {
    Key? key,
    this.padding,
    this.color = Colors.black,
    this.borderRadius,
  }) : super(key: key);

  /// 文本
  final String text;

  /// 内边距
  final EdgeInsets? padding;

  /// 颜色
  /// 背景颜色 color.withOpacity(.46)
  final Color? color;

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 4,
          ),
      decoration: BoxDecoration(
        color: color?.withOpacity(.25),
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: WcaoTheme.fsSm,
          color: color,
        ),
      ),
    );
  }
}
