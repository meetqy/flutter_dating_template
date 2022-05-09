import 'package:flutter/material.dart';
import 'package:flutter_dating_template/config.dart';
import 'package:flutter_dating_template/utils/base.dart';
import 'package:flutter_dating_template/utils/theme.dart';
import 'package:flutter_dating_template/wcao/kit/tag.dart';

class PageViewLike extends StatefulWidget {
  const PageViewLike({Key? key}) : super(key: key);

  @override
  State<PageViewLike> createState() => _PageViewLikeState();
}

class _PageViewLikeState extends State<PageViewLike> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 4),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(44),
                      child: UtillBase.imageCache(
                          '${WcaoConfig.cdn}/avatar/4.jpg'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '西瓜',
                            style: TextStyle(
                              color: WcaoTheme.base,
                              fontWeight: FontWeight.bold,
                              fontSize: WcaoTheme.fsL,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: Text(
                              "2021-09-20 10:30",
                              style: TextStyle(
                                color: WcaoTheme.secondary,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: 172,
                            height: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    '${WcaoConfig.cdn}/phone/girls/1.jpg'),
                              ),
                            ),
                            child: Icon(
                              Icons.play_circle_fill,
                              color: WcaoTheme.primary,
                              size: WcaoTheme.fsBase * 4,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: Text(
                              "今天性情真好呀！",
                              style: TextStyle(
                                color: WcaoTheme.base,
                                fontSize: WcaoTheme.fsL,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: Wrap(
                              spacing: 12,
                              children: [
                                Tag(
                                  "#日常记录",
                                  borderRadius: BorderRadius.circular(24),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 8,
                                  ),
                                  color: WcaoTheme.primary,
                                ),
                                Tag(
                                  "#时代少年团",
                                  borderRadius: BorderRadius.circular(24),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 8,
                                  ),
                                  color: WcaoTheme.primary,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // 分享
                                iconText(Icons.offline_share, '21'),
                                Row(
                                  children: [
                                    // 关注
                                    iconText(
                                        Icons.favorite_border_outlined, '21'),

                                    // 评论
                                    Container(
                                      margin: const EdgeInsets.only(left: 24),
                                      child: iconText(
                                          Icons.add_comment_outlined, '21'),
                                    ),
                                  ],
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
            ),
          );
        },
      ),
    );
  }

  Row iconText(IconData icondata, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icondata,
          color: WcaoTheme.secondary,
          size: WcaoTheme.fsXl,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            text,
            style: TextStyle(color: WcaoTheme.secondary),
          ),
        )
      ],
    );
  }
}
