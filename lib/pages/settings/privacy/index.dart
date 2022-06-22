import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/ui/cell.dart';
import 'package:get/get.dart';

class SettingsPrivacy extends StatefulWidget {
  const SettingsPrivacy({Key? key}) : super(key: key);

  @override
  State<SettingsPrivacy> createState() => _SettingsPrivacyState();
}

class _SettingsPrivacyState extends State<SettingsPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('隐私'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Cell(
              '屏蔽联系人',
              right: Transform.scale(
                scale: .8,
                child: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
            Cell(
              '允许他人看到我的关注和被关注',
              right: Transform.scale(
                scale: .8,
                child: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
            Cell(
              '黑名单',
              onTap: () => Get.toNamed('/settings/backlist'),
            ),
          ],
        ),
      ),
    );
  }
}
