import 'package:flutter_dating_template/pages/history_match/mock.dart';
import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter_dating_template/config.dart';

class MockLike extends MockHistoryMatch {
  MockLike({
    required String nickName,
    required int age,
    required String sex,
    required String constellation,
    required String avatar,
    required this.time,
    required this.text,
    required this.mediaType,
    required this.media,
    required this.tag,
    required this.share,
    required this.fav,
    required this.comment,
  }) : super(
          nickName: nickName,
          age: age,
          sex: sex,
          constellation: constellation,
          avatar: avatar,
        );

  static final List<MockLike> _data = [];

  /// 时间
  final String time;

  /// 发布内容
  final String text;

  /// 多媒体类型
  /// true: 视频
  /// false: 图片
  final bool mediaType;

  /// 多媒体
  final List<String> media;

  /// 标签
  final List<String> tag;

  final int share;

  final int fav;

  final int comment;

  static List<MockLike> get({int num = 12}) {
    for (var i = 0; i < num; i++) {
      var mockType = mock.boolean();
      _data.add(MockLike(
        nickName: mock.cname(),
        age: mock.integer(min: 18, max: 45),
        sex: mock.pick(["女", "男", "其他"]),
        constellation: mock.pick([
          "白羊座",
          "金牛座",
          "双子座",
          "巨蟹座",
          "狮子座",
          "处女座",
          "天秤座",
          "天蝎座",
          "射手座",
          "摩羯座",
          "水瓶座",
          "双鱼座",
        ]),
        avatar: '${WcaoConfig.cdn}/avatar/${mock.integer(min: 1, max: 18)}.jpg',
        tag: List.generate(mock.integer(min: 1, max: 4),
            (index) => '#${mock.ctitle(min: 3, max: 10)}'),
        mediaType: mockType,
        media: List.generate(mock.integer(min: 0, max: 4), (index) {
          if (mockType) {
            return '${WcaoConfig.cdn}/phone/girls/${mock.integer(min: 1, max: 5)}.jpg';
          } else {
            return '${WcaoConfig.cdn}/avatar/profile/${mock.integer(min: 1, max: 19)}.jpg';
          }
        }),
        share: mock.integer(min: 1, max: 99),
        fav: mock.integer(min: 1, max: 99),
        comment: mock.integer(min: 1, max: 99),
        text: mock.cparagraph(min: 1, max: 4),
        time: mock.dateTime(start: DateTime(2022)).toIso8601String(),
      ));
    }

    return _data;
  }

  static clear() {
    _data.clear();
  }
}
