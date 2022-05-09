import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_template/config.dart';
import 'package:flutter_dating_template/pages/home/index/search_dialog.dart';
import 'package:flutter_dating_template/wcao/kit/theme.dart';
import 'package:flutter_dating_template/wcao/utils/index.dart';
import 'package:get/get.dart';

import 'dart:math' as math;

class PageViewIndex extends StatefulWidget {
  const PageViewIndex({Key? key}) : super(key: key);

  @override
  State<PageViewIndex> createState() => _PageViewIndexState();
}

class _PageViewIndexState extends State<PageViewIndex> {
  List<String> swipers = [
    "${WcaoConfig.cdn}/phone/girls/1.jpg",
    "${WcaoConfig.cdn}/phone/girls/2.jpg",
    "${WcaoConfig.cdn}/phone/girls/3.jpg",
    "${WcaoConfig.cdn}/phone/girls/4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width - 24;
    return Column(
      children: [
        AppBar(
          title: appBarTitle(),
          actions: [
            InkWell(
              onTap: () => Get.toNamed('/history-match'),
              child: Row(
                children: [
                  Center(
                    child: Text(
                      '匹配历史',
                      style: TextStyle(
                        color: WcaoTheme.base,
                        fontSize: WcaoTheme.fsBase,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6, right: 12),
                    width: 64,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        avatar('/avatar/1.jpg'),
                        Positioned(left: 14, child: avatar('/avatar/2.jpg')),
                        Positioned(left: 28, child: avatar('/avatar/3.jpg')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Swiper(
              itemCount: swipers.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 12,
                    right: 12,
                    bottom: 36,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Opacity(
                            opacity: .25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: WcaoUtils.imageCache(swipers[index]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 48),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(children: [
                            SizedBox(
                              width: boxWidth + 24,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: WcaoUtils.imageCache(swipers[index]),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              width: boxWidth,
                              child: Container(
                                color: Colors.black.withOpacity(.15),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 36,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '圆子',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: WcaoTheme.outline,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.fmd_good,
                                                color: WcaoTheme.outline,
                                                size: WcaoTheme.fsBase,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 4),
                                                child: Text(
                                                  '1.1km',
                                                  style: TextStyle(
                                                    fontSize: WcaoTheme.fsBase,
                                                    color: WcaoTheme.outline,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              child: tag('180m'),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              child: tag('射手座'),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              child: tag('21岁'),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(64),
                                      ),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.redAccent,
                                        size: 48,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget appBarTitle() {
    return InkWell(
      onTap: () {
        /// 弹出search
        showModalBottomSheet(
          builder: (context) => const SearchDialog(),
          context: context,
          isScrollControlled: true,
        );
      },
      child: Row(children: [
        Text(
          '匹配条件',
          style: TextStyle(fontSize: WcaoTheme.fsBase),
        ),
        Container(
          margin: const EdgeInsets.only(left: 4),
          child: Transform.rotate(
            angle: -math.pi / 2,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: WcaoTheme.fsBase,
            ),
          ),
        ),
      ]),
    );
  }

  Container tag(String str) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      color: Colors.black.withOpacity(.46),
      child: Text(
        str,
        style: TextStyle(
          fontSize: WcaoTheme.fsSm,
          color: WcaoTheme.outline,
        ),
      ),
    );
  }

  Widget avatar(String url) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: WcaoTheme.outline),
        borderRadius: BorderRadius.circular(24),
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundImage: NetworkImage(WcaoConfig.cdn + url),
      ),
    );
  }
}
