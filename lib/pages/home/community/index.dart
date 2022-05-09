import 'package:flutter/material.dart';

class PageViewCommunity extends StatefulWidget {
  const PageViewCommunity({Key? key}) : super(key: key);

  @override
  State<PageViewCommunity> createState() => _PageViewCommunityState();
}

class _PageViewCommunityState extends State<PageViewCommunity> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('社区'),
    );
  }
}
