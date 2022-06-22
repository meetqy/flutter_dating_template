import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

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
    this.close = false,
    this.onClose,
    this.border,
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

  /// 关闭按钮
  final bool close;

  /// 关闭回调
  final VoidCallback? onClose;

  /// 边框
  final Border? border;

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
        border: border,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? WcaoTheme.fsSm,
              color: color,
              fontWeight: fontWeight,
            ),
          ),
          close
              ? InkWell(
                  onTap: onClose,
                  child: Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Icon(
                      Icons.close,
                      color: color,
                      size: WcaoTheme.fsBase,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
