import 'package:flutter/material.dart';
import 'package:flutter_dating_template/config.dart';
import 'package:flutter_dating_template/wcao/kit/bottom_drive.dart';
import 'package:flutter_dating_template/wcao/kit/tag.dart';
import 'package:flutter_dating_template/wcao/kit/theme.dart';
import 'package:flutter_dating_template/wcao/utils/index.dart';

class PageViewMine extends StatefulWidget {
  const PageViewMine({Key? key}) : super(key: key);

  @override
  State<PageViewMine> createState() => _PageViewMineState();
}

class _PageViewMineState extends State<PageViewMine> {
  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 376,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  size: WcaoTheme.fsBase * 1.6,
                  color: WcaoTheme.base,
                ),
                onPressed: () {},
              )
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double top = constraints.biggest.height;
                bool isOpacity =
                    top == MediaQuery.of(context).padding.top + kToolbarHeight;
                return FlexibleSpaceBar(
                  // collapseMode: CollapseMode.pin,
                  title: AnimatedOpacity(
                    duration: const Duration(microseconds: 300),
                    opacity: isOpacity ? 1 : 0,
                    child: Text(
                      "你好呀我你好",
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
                          '${WcaoConfig.cdn}/phone/girls/2.jpg',
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
                  adapterItem(123, '访客'),
                  adapterDrive(),
                  adapterItem(22, '好友'),
                  adapterDrive(),
                  adapterItem(102, '粉丝'),
                ],
              ),
            ),
          ),
        ];
      }),
      body: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2021-10-19 10:00',
                          style: TextStyle(color: WcaoTheme.secondary),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Text(
                            '看看plmm',
                            style: TextStyle(fontSize: WcaoTheme.fsL),
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      iconSize: WcaoTheme.fsBase * 2.5,
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: WcaoUtils.imageCache(
                      "${WcaoConfig.cdn}/phone/girls/6.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 12,
                    runSpacing: 6,
                    children: List.generate(
                        6,
                        (index) => Tag(
                              '# 追星少年',
                              color: WcaoTheme.primary,
                              borderRadius: BorderRadius.circular(24),
                            )).toList(),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: BottomDrive(),
          ),
        ],
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
              '${WcaoConfig.cdn}/avatar/12.jpg',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '习安保处の',
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
              '120天 5动态',
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
                8,
                (index) => Tag(
                  '厨艺',
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  backgroundColor: Colors.black.withOpacity(.4),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  fontSize: WcaoTheme.fsBase,
                  fontWeight: FontWeight.bold,
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
