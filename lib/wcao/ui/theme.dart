import 'package:flutter/material.dart';

/// 主题相近的颜色如何处理？
///
/// ```
/// WcaoTheme.primay.withOpacity(.5);
/// ```

class WcaoTheme {
  /// 主题色
  static Color primary = const Color(0xff937DFF);

  /// 聚焦
  static Color primaryFocus = const Color.fromRGBO(102, 110, 232, 1);

  /// 文字主色
  static Color base = const Color(0xff323232);

  /// 次色
  static Color secondary = const Color(0xff949494);

  /// 辅助文字
  static Color placeholder = const Color(0xffcccccc);

  /// outline
  static Color outline = const Color(0xffe4e4e4);

  /// background color
  static Color bgColor = const Color.fromRGBO(242, 242, 242, .4);

  /// radius
  static BorderRadius radius = BorderRadius.circular(8);

  ///  fontSize 最小文字
  static double fsXs = 10;

  /// fontSize sm 次要文字
  static double fsSm = 12;

  /// fontSize base
  static double fsBase = 14;

  /// fontSize l 小标题
  static double fsL = 16;

  /// fontSize xl 标题
  static double fsXl = 18;
}
