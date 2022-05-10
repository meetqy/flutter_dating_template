import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/widgets/publish_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// HACK: 社区-关注

class PageViewLike extends StatefulWidget {
  const PageViewLike({Key? key}) : super(key: key);

  @override
  State<PageViewLike> createState() => _PageViewLikeState();
}

class _PageViewLikeState extends State<PageViewLike> {
  List<MockLike> items = [];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      MockLike.clear();
      items = MockLike.get();
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (items.length > 60) {
      _refreshController.loadNoData();
    }

    setState(() {
      items = MockLike.get();
    });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      items = MockLike.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullDown: true,
        enablePullUp: true,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            return PublishCard(item);
          },
        ),
      ),
    );
  }
}
