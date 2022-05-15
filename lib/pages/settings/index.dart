import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/cell.dart';
import 'package:flutter_wcao/ui/theme.dart';
import 'package:get/get.dart';

/// HACK: 设置

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
            Cell(
              '账号安全',
              onTap: () => Get.toNamed('/settings/account'),
            ),
            Cell('消息通知'),
            Cell('隐私设置'),
            Cell(
              '清除缓存',
              right: Text(
                '190M',
                style: TextStyle(fontSize: WcaoTheme.fsL),
              ),
            ),
            Cell('关于我们'),
            Cell('退出登录', border: false),
          ],
        ),
      ),
    );
  }
}
