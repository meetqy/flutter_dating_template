import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/history_match/mock.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryMatch extends StatefulWidget {
  const HistoryMatch({Key? key}) : super(key: key);

  @override
  State<HistoryMatch> createState() => _HistoryMatchState();
}

class _HistoryMatchState extends State<HistoryMatch> {
  List<MockHistoryMatch> items = [];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      items = MockHistoryMatch.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text('历史匹配'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: GridView.count(
          crossAxisCount: items.length,
          children: items.map((item) {
            return Center(child: Text(item.nickName));
          }).toList(),
        ),
      ),
    );
  }
}
