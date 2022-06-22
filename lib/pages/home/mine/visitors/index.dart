import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

class MineVisitors extends StatefulWidget {
  const MineVisitors({Key? key}) : super(key: key);

  @override
  State<MineVisitors> createState() => _MineVisitorsState();
}

class _MineVisitorsState extends State<MineVisitors> {
  List<MockLike> lists = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      lists = MockLike.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('访客'),
      ),
      body: SafeArea(
        child: ListView(
          children: lists.map((e) => listCard(e)).toList(),
        ),
      ),
    );
  }
}

Container listCard(MockLike item) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    margin: const EdgeInsets.only(top: 24),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(item.avatar),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.nickName,
                      style: TextStyle(
                        fontSize: WcaoTheme.fsXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${mock.integer(min: 1, max: 99)}天 | ${mock.integer(min: 1, max: 99)}动态',
                        style: TextStyle(
                          color: WcaoTheme.secondary,
                          fontSize: WcaoTheme.fsBase,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${mock.integer(min: 1, max: 59)}分钟前',
                  style: TextStyle(
                    color: WcaoTheme.secondary,
                    fontSize: WcaoTheme.fsBase,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
