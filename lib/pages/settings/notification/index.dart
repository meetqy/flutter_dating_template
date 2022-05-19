import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/theme.dart';

/// HACK: 消息通知

class SettingsNotification extends StatefulWidget {
  const SettingsNotification({Key? key}) : super(key: key);

  @override
  State<SettingsNotification> createState() => _SettingsNotificationState();
}

class _SettingsNotificationState extends State<SettingsNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息通知'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              rowItem('允许新消息通知'),
              rowItem('声音提示'),
              rowItem('震动提示'),
            ],
          ),
        ),
      ),
    );
  }

  Container rowItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: .5,
            color: WcaoTheme.outline,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: WcaoTheme.fsL),
          ),
          Transform.scale(
            scale: .8,
            child: CupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
