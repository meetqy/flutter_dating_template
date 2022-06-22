import 'package:flutter/material.dart';

class WcaoThemeTest {
  WcaoThemeTest._internal();

  factory WcaoThemeTest() => _instance;

  static late final WcaoThemeTest _instance = WcaoThemeTest._internal();

  /// Primary
  static ThemeColorType get primary => _primary;
  static late ThemeColorType _primary = ThemeColorType(Colors.blue);

  /// Secondary
  static ThemeColorType get secondary => _secondary;
  static late ThemeColorType _secondary = ThemeColorType(Colors.deepOrange);

  /// Error
  static ThemeColorType get error => _error;
  static late ThemeColorType _error = ThemeColorType(Colors.red);

  static init({
    ThemeColorType? primary,
    ThemeColorType? secondary,
    ThemeColorType? error,
  }) {
    _primary = primary!;
    _secondary = secondary!;
    _error = error!;
  }
}

class ThemeColorType {
  /// 主色
  final Color main;

  /// lighten(main, amount)
  final double lightAmount;

  /// darken(main, amount)
  final double darkAmount;

  /// 主色 深色
  get dark => _darken(main, darkAmount);

  /// 主色 浅色
  get light => _lighten(main, lightAmount);

  ThemeColorType(this.main, {this.darkAmount = .07, this.lightAmount = .25})
      : assert(darkAmount >= 0 && darkAmount <= 1),
        assert(lightAmount >= 0 && lightAmount <= 1);

  /// 深一点
  Color _darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  /// 浅一点
  Color _lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
