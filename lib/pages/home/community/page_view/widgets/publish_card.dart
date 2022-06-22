import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/tag.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

class PublishCard extends StatelessWidget {
  const PublishCard(this.item, {Key? key}) : super(key: key);

  final MockLike item;

  @override
  Widget build(BuildContext context) {
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
                child: WcaoUtils.imageCache(item.avatar),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nickName,
                      style: TextStyle(
                        color: WcaoTheme.base,
                        fontWeight: FontWeight.bold,
                        fontSize: WcaoTheme.fsL,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        item.time,
                        style: TextStyle(
                          color: WcaoTheme.secondary,
                        ),
                      ),
                    ),
                    buildMedia(item.mediaType, item.media),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        item.text,
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
                          runSpacing: 6,
                          children: item.tag.map((e) {
                            return Tag(
                              e,
                              borderRadius: BorderRadius.circular(24),
                              fontSize: WcaoTheme.fsBase,
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              color: WcaoTheme.primary,
                            );
                          }).toList()),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 分享
                          iconText(Icons.offline_share, item.share.toString()),
                          Row(
                            children: [
                              // 关注
                              iconText(
                                Icons.favorite_border_outlined,
                                item.fav.toString(),
                              ),

                              // 评论
                              Container(
                                margin: const EdgeInsets.only(left: 24),
                                child: iconText(
                                  Icons.add_comment_outlined,
                                  item.comment.toString(),
                                ),
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
  }

  /// 显示多媒体
  Widget buildMedia(bool type, List<String> media) {
    if (media.isEmpty) {
      return Container();
    }

    if (type) {
      // 视频
      return Container(
        margin: const EdgeInsets.only(top: 8),
        width: 172,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(media[0]),
          ),
        ),
        child: Icon(
          Icons.play_circle_fill,
          color: WcaoTheme.primary,
          size: WcaoTheme.fsBase * 4,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: media
              .map((e) => SizedBox(
                    width: 124,
                    height: 124,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: WcaoUtils.imageCache(e),
                    ),
                  ))
              .toList(),
        ),
      );
    }
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
