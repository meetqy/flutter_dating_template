import 'package:flutter/material.dart';

/// HACK: 社区-发现
class PageViewFound extends StatefulWidget {
  const PageViewFound({Key? key}) : super(key: key);

  @override
  State<PageViewFound> createState() => _PageViewFoundState();
}

class _PageViewFoundState extends State<PageViewFound> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('found'));
  }
}
