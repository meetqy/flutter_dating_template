import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  bool addImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发布动态'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('发布'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: '说出你的故事',
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),

            // 底部内容
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 添加图片
                Visibility(
                  visible: addImage,
                  child: Container(
                    height: 68,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      children: [
                        DottedBorder(
                          color: WcaoTheme.placeholder,
                          strokeWidth: 1,
                          padding: EdgeInsets.zero,
                          dashPattern: const [4, 8],
                          child: SizedBox(
                            width: 68,
                            height: 68,
                            child: Icon(
                              Icons.add,
                              color: WcaoTheme.secondary,
                            ),
                          ),
                        ),
                        selectedImage('https://wcao.cc/r/a/avatar?1'),
                        selectedImage('https://wcao.cc/r/a/avatar?2'),
                        selectedImage('https://wcao.cc/r/a/avatar?3'),
                        selectedImage('https://wcao.cc/r/a/avatar?4'),
                        selectedImage('https://wcao.cc/r/a/avatar?5'),
                      ],
                    ),
                  ),
                ),
                // 添加话题
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          color: WcaoTheme.placeholder.withOpacity(.25),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '#话题',
                          style: TextStyle(color: WcaoTheme.secondary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: .5, color: WcaoTheme.placeholder.withOpacity(.5)),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        addImage = true;
                      });
                    },
                    icon: Icon(
                      Icons.image_outlined,
                      color: WcaoTheme.secondary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: WcaoTheme.secondary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container selectedImage(String src) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Stack(
        children: [
          SizedBox(
            width: 68,
            height: 68,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: WcaoUtils.imageCache(src, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 68,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                color: WcaoTheme.base.withOpacity(.5),
              ),
              alignment: Alignment.center,
              child: const Text(
                '删除',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
