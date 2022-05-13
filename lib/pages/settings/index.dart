import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            cell('账号安全'),
            cell('消息通知'),
            cell('隐私设置'),
            cell(
              '清除缓存',
              right: Text(
                '190M',
                style: TextStyle(fontSize: WcaoTheme.fsL),
              ),
            ),
            cell('关于我们'),
            cell('退出登录', border: false),
          ],
        ),
      ),
    );
  }

  Padding cell(String text, {Widget? right, bool border = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
    );
  }
}
