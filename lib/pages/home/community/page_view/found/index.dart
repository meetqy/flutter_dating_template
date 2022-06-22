import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// HACK: 社区-发现
class PageViewFound extends StatefulWidget {
  const PageViewFound({Key? key}) : super(key: key);

  @override
  State<PageViewFound> createState() => _PageViewFoundState();
}

class _PageViewFoundState extends State<PageViewFound> {
  List<MockLike> list = [];

  @override
  void initState() {
    super.initState();

    MockLike.clear();

    setState(() {
      list = MockLike.get(num: 12);
    });
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    MockLike.clear();

    setState(() {
      list = MockLike.get(num: 12);
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));

    if (list.length > 60) {
      return _refreshController.loadNoData();
    }

    setState(() {
      list = MockLike.get(num: 12);
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.6,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          var item = list[index];
          return Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: WcaoUtils.imageCache(
                    item.avatar,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  item.text,
                  maxLines: 2,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: WcaoUtils.imageCache(item.avatar),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: Text(
                            item.nickName,
                            style: TextStyle(
                                color: WcaoTheme.secondary,
                                fontSize: WcaoTheme.fsSm),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color: WcaoTheme.secondary,
                          size: WcaoTheme.fsBase,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: Text(
                            "${item.fav}",
                            style: TextStyle(
                              color: WcaoTheme.secondary,
                              fontSize: WcaoTheme.fsSm,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
