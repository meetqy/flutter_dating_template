import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

class Cell extends StatelessWidget {
  const Cell(
    this.text, {
    Key? key,
    this.border = true,
    this.right,
    this.onTap,
  }) : super(key: key);

  /// 底部 border 是否显示
  final bool border;

  /// 右侧文字
  final String text;

  /// 右侧内容
  final Widget? right;

  /// 点击回调
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
                width: .5,
                color: border ? WcaoTheme.outline : Colors.transparent),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: WcaoTheme.fsL,
                  color: WcaoTheme.base,
                ),
              ),
              right ??
                  Icon(
                    Icons.arrow_forward_ios,
                    size: WcaoTheme.fsXl,
                    color: WcaoTheme.secondary,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
