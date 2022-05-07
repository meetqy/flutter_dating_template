import 'package:flutter/material.dart';

class PageViewMine extends StatefulWidget {
  PageViewMine({Key? key}) : super(key: key);

  @override
  State<PageViewMine> createState() => _PageViewMineState();
}

class _PageViewMineState extends State<PageViewMine> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的'),
    );
  }
}
