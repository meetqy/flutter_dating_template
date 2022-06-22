import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

class FirendsDialog extends StatefulWidget {
  const FirendsDialog({Key? key}) : super(key: key);

  @override
  State<FirendsDialog> createState() => _FirendsDialogState();
}

class _FirendsDialogState extends State<FirendsDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 36),
                padding: const EdgeInsets.only(top: 36, bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      alignment: Alignment.center,
                      child: Text(
                        '西瓜',
                        style: TextStyle(
                          fontSize: WcaoTheme.fsXl,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      alignment: Alignment.center,
                      child: Container(
                        width: 128,
                        height: 128,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                        ),
                        child: const Text('二维码'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '扫码二维码，来爱交友找我玩吧!',
                        style: TextStyle(color: WcaoTheme.secondary),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -36,
                child: CircleAvatar(
                  radius: 36,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Image.network(
                        'https://wcao.cc/image-space/api/avatar?xxx'),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  '分享',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: WcaoTheme.fsL,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareButton('保存图片', Icons.download, Colors.red),
                      shareButton('微信好友', Icons.wechat, Colors.green),
                      shareButton('朋友圈', Icons.person, Colors.orange),
                      shareButton(
                          '朋友圈', Icons.wb_twilight_rounded, Colors.teal),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column shareButton(String text, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
