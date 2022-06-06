import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_dating_template/pages/home/message/qr_scan.dart';
import 'package:flutter_wcao/ui/theme.dart';
import 'package:scan/scan.dart';

class PageViewMessage extends StatefulWidget {
  const PageViewMessage({Key? key}) : super(key: key);

  @override
  State<PageViewMessage> createState() => _PageViewMessageState();
}

class _PageViewMessageState extends State<PageViewMessage> {
  List<MockLike> lists = [];
  ScanController controller = ScanController();

  @override
  void initState() {
    super.initState();

    setState(() {
      lists = MockLike.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text('聊天'),
              actions: [
                PopupMenuButton(
                  icon: Icon(
                    Icons.add,
                    size: WcaoTheme.fsBase * 1.75,
                  ),
                  onSelected: (item) {
                    if (item == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QrScan(),
                        ),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: const Text('扫一扫'),
                      value: 1,
                      onTap: () {
                        // print(123);
                        // Get.toNamed('/settings/account');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) {
                        //       print(456);
                        //       return Container(
                        //         width: 250,
                        //         height: 250,
                        //         color: Colors.red,
                        //       );
                        //     },
                        //   ),
                        // );
                        // Navigator.push(
                        //   ctx,
                        //   MaterialPageRoute(builder: (_) {
                        //     print(456);
                        //     return Container(
                        //       color: Colors.red,
                        //       width: 250,
                        //       height: 250,
                        // child: ScanView(
                        //   controller: controller,
                        //   onCapture: (data) {},
                        // ),
                        //     );
                        //     // return Container(width: 250,height: 250,child: ScanView(),)
                        //   }),
                        // );
                      },
                    ),
                    const PopupMenuItem(child: Text('添加好友')),
                  ],
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    search(),
                    Column(
                      children: lists.map((e) => listCard(e)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
              padding: const EdgeInsets.only(bottom: 20),
              margin: const EdgeInsets.only(left: 24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: .5,
                    color: WcaoTheme.placeholder.withOpacity(.5),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.nickName,
                        style: TextStyle(
                          fontSize: WcaoTheme.fsXl,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.time.split('T')[0],
                        style: TextStyle(
                            fontSize: WcaoTheme.fsSm,
                            color: WcaoTheme.secondary),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              item.text,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: WcaoTheme.secondary,
                                fontSize: WcaoTheme.fsBase,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: WcaoTheme.primary,
                          child: Text(
                            '${item.fav}',
                            style: TextStyle(fontSize: WcaoTheme.fsSm),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container search() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: WcaoTheme.bgColor,
        ),
        child: TextField(
          enableSuggestions: false,
          autocorrect: false,
          style: TextStyle(fontSize: WcaoTheme.fsBase),
          decoration: const InputDecoration(
            hintText: "请输入搜索关键词",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
