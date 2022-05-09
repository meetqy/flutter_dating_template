import 'package:flutter/material.dart';

class PageViewMessage extends StatefulWidget {
  const PageViewMessage({Key? key}) : super(key: key);

  @override
  State<PageViewMessage> createState() => _PageViewMessageState();
}

class _PageViewMessageState extends State<PageViewMessage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('消息'),
    );
  }
}
