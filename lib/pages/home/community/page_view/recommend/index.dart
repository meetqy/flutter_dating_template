import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/widgets/publish_card.dart';
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/tag.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

/// HACK: 社区-推荐
class PageViewRecommend extends StatefulWidget {
  const PageViewRecommend({Key? key}) : super(key: key);

  @override
  State<PageViewRecommend> createState() => _PageViewRecommendState();
}

class _PageViewRecommendState extends State<PageViewRecommend> {
  /// mockdata

  String searchText = mock.csentence(min: 3, max: 10);

  /// 热门话题
  List<Map> list = List.generate(mock.integer(min: 4, max: 12), (index) {
    return {
      "avatar": WcaoUtils.getRandomImage(),
      "tag": mock.cword(min: 2, max: 4)
    };
  });

  /// 热门标签
  List<String> labelData = List.generate(
      mock.integer(min: 4, max: 10), (index) => mock.cword(min: 4, max: 12));

  /// 发布的类容
  List<MockLike> items = [];

  @override
  void initState() {
    super.initState();
    MockLike.clear();
    setState(() {
      items = MockLike.get(num: 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 12, bottom: 24),
            color: Colors.white,
            child: Column(
              children: [
                search(),
                topic(),
                label(context),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            color: Colors.white,
            child: Column(
              children: items.map((e) => PublishCard(e)).toList(),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 48, left: 48, right: 48),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  height: .5,
                  color: WcaoTheme.placeholder,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('我是有底线的',
                      style: TextStyle(color: WcaoTheme.placeholder)),
                ),
                Expanded(
                    child: Container(
                  height: .25,
                  color: WcaoTheme.placeholder,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container label(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: labelData
            .map((e) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    '# $e',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: WcaoTheme.fsL,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Container topic() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: 76,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: list
            .map(
              (item) => Container(
                margin: const EdgeInsets.only(right: 12),
                alignment: Alignment.bottomLeft,
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(item['avatar']),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Tag(
                      item['tag'],
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 4, right: 6),
                      backgroundColor: WcaoTheme.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Padding search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: WcaoTheme.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 36,
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: WcaoTheme.placeholder,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                searchText,
                style: TextStyle(
                  color: WcaoTheme.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
