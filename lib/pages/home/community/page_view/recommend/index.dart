import 'package:flutter/material.dart';

class PageViewRecommend extends StatefulWidget {
  const PageViewRecommend({Key? key}) : super(key: key);

  @override
  State<PageViewRecommend> createState() => _PageViewRecommendState();
}

class _PageViewRecommendState extends State<PageViewRecommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("推荐"),
    );
  }
}
