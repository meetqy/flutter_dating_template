import 'package:flutter/material.dart';

class PageViewCommunity extends StatefulWidget {
  PageViewCommunity({Key? key}) : super(key: key);

  @override
  State<PageViewCommunity> createState() => _PageViewCommunityState();
}

class _PageViewCommunityState extends State<PageViewCommunity> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('社区'),
    );
  }
}
