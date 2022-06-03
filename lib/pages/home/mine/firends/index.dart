import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_wcao/ui/theme.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

class MineFirends extends StatefulWidget {
  const MineFirends({Key? key}) : super(key: key);

  @override
  State<MineFirends> createState() => _MineFirendsState();
}

class _MineFirendsState extends State<MineFirends> {
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
        title: const Text('好友'),
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
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: WcaoTheme.placeholder,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      '已关注',
                      style: TextStyle(
                          fontSize: WcaoTheme.fsSm, color: Colors.white),
                    ),
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
