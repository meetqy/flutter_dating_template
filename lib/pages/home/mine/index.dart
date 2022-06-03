import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_dating_template/pages/home/mine/mock.dart';
import 'package:flutter_wcao/kit/index.dart';
import 'package:flutter_wcao/ui/tag.dart';
import 'package:flutter_wcao/ui/theme.dart';
import 'package:get/get.dart';

class PageViewMine extends StatefulWidget {
  const PageViewMine({Key? key}) : super(key: key);

  @override
  State<PageViewMine> createState() => _PageViewMineState();
}

/// TODO: NestedScrollView 如何实现上拉加载，下拉刷新

class _PageViewMineState extends State<PageViewMine> {
  MockMine mine = MockMine.get();
  List<MockLike> items = [];

  @override
  void initState() {
    super.initState();
    MockLike.clear();

    setState(() {
      items = MockLike.get(num: 4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 376,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  size: WcaoTheme.fsBase * 1.6,
                  color: WcaoTheme.base,
                ),
                onPressed: () {
                  Get.toNamed('/settings');
                },
              )
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double top = constraints.biggest.height;
                bool isOpacity =
                    top == MediaQuery.of(context).padding.top + kToolbarHeight;
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: const Duration(microseconds: 300),
                    opacity: isOpacity ? 1 : 0,
                    child: Text(
                      mine.nickName,
                      style: TextStyle(
                        color: WcaoTheme.base,
                        fontSize: WcaoTheme.fsXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: WcaoUtils.imageCache(
                          mine.bg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          color: Colors.black.withOpacity(.33),
                        ),
                      ),
                      Positioned(
                        bottom: 56,
                        width: MediaQuery.of(context).size.width,
                        child: profile(),
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          /// 数据信息
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  adapterItem(mine.visits, '访客'),
                  adapterDrive(),
                  adapterItem(mine.friends, '好友'),
                  adapterDrive(),
                  adapterItem(mine.fans, '粉丝'),
                ],
              ),
            ),
          ),
        ];
      }),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(), // 重要
        padding: const EdgeInsets.all(0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return dynamicItem(items[index], items.length - 1 > index);
        },
      ),
    );
  }

  /// 我的动态 item
  Container dynamicItem(MockLike item, bool bottomBorder) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .5,
              color: bottomBorder ? WcaoTheme.outline : Colors.transparent,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time.split('T')[0],
                        style: TextStyle(color: WcaoTheme.secondary),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 300,
                        child: Text(
                          item.text,
                          style: TextStyle(
                            fontSize: WcaoTheme.fsL,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  iconSize: WcaoTheme.fsBase * 2.5,
                  onPressed: () {},
                ),
              ],
            ),
            item.media.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: WcaoUtils.imageCache(
                        item.media[0],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                : Container(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: item.media.isNotEmpty ? 24 : 12),
              child: Wrap(
                spacing: 12,
                runSpacing: 6,
                children: List.generate(
                  item.tag.length,
                  (index) => Tag(
                    item.tag[index],
                    color: WcaoTheme.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column adapterItem(int num, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$num",
          style: TextStyle(
            fontSize: WcaoTheme.fsXl,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: WcaoTheme.secondary,
          ),
        )
      ],
    );
  }

  Container adapterDrive() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      height: 12,
      width: .5,
      color: WcaoTheme.placeholder,
    );
  }

  Widget profile() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(
              mine.avatar,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mine.nickName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: WcaoTheme.fsXl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.edit_note,
                  color: Colors.white,
                  size: WcaoTheme.fsBase * 2,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Text(
              '${mine.createDay}天 ${mine.tags.length}动态',
              style: TextStyle(
                color: WcaoTheme.placeholder,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 6,
              children: List.generate(
                mine.tags.length,
                (index) {
                  if (index >= mine.tags.length - 1) {
                    // 添加标签
                    return InkWell(
                      onTap: () => Get.toNamed('/mine/add-tag'),
                      child: Tag(
                        '+',
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 4),
                        backgroundColor: Colors.black.withOpacity(.4),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        fontSize: WcaoTheme.fsBase,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Tag(
                      mine.tags[index],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      backgroundColor: Colors.black.withOpacity(.4),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      fontSize: WcaoTheme.fsBase,
                      fontWeight: FontWeight.bold,
                    );
                  }
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
