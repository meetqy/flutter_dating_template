import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/theme.dart';
import 'package:get/get.dart';

class SettingsAbout extends StatefulWidget {
  const SettingsAbout({Key? key}) : super(key: key);

  @override
  State<SettingsAbout> createState() => _SettingsAboutState();
}

class _SettingsAboutState extends State<SettingsAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于我们'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 80, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: WcaoTheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.baby_changing_station,
                      color: Colors.white,
                      size: WcaoTheme.fsBase * 3,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      '爱交友',
                      style: TextStyle(
                        fontSize: WcaoTheme.fsBase * 1.75,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      'V1.0.0',
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed('/agreement/privacy'),
                    child: Text(
                      '隐私政策',
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                  ),
                  Container(
                    width: .5,
                    color: WcaoTheme.outline,
                    height: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/agreement/user'),
                    child: Text(
                      '用户协议',
                      style: TextStyle(
                        color: WcaoTheme.secondary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
