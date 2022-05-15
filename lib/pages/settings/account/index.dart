import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/cell.dart';

class SettingsAccount extends StatefulWidget {
  const SettingsAccount({Key? key}) : super(key: key);

  @override
  State<SettingsAccount> createState() => _SettingsAccountState();
}

class _SettingsAccountState extends State<SettingsAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('账号设置'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Cell('修改密码'),
            Cell('更换绑定手机号'),
            Cell('注销账号'),
          ],
        ),
      ),
    );
  }
}
