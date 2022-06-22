import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

class BottomDrive extends StatelessWidget {
  const BottomDrive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 48, left: 48, right: 48),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            height: .5,
            color: WcaoTheme.placeholder,
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child:
                Text('我是有底线的', style: TextStyle(color: WcaoTheme.placeholder)),
          ),
          Expanded(
              child: Container(
            height: .25,
            color: WcaoTheme.placeholder,
          )),
        ],
      ),
    );
  }
}
