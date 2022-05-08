import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter_dating_template/config.dart';

class MockHistoryMatch {
  static final List<MockHistoryMatch> _data = [];

  final String nickName;
  final int age;

  /// 0 女
  /// 1 男
  /// 2 其他
  final int sex;
  final String constellation;
  final String avatar;

  MockHistoryMatch({
    required this.nickName,
    required this.age,
    required this.sex,
    required this.constellation,
    required this.avatar,
  });

  static List<MockHistoryMatch> get() {
    for (var i = 0; i < 12; i++) {
      _data.add(MockHistoryMatch(
        nickName: mock.cname(),
        age: mock.integer(min: 18, max: 45),
        sex: mock.pick([0, 1, 2]),
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
        avatar: '${WcaoConfig.cdn}/${mock.integer(min: 1, max: 12)}.svg',
      ));
    }

    return _data;
  }

  static clean() {
    _data.clear();
  }
}
