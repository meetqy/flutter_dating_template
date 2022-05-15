import 'package:get/get.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

class TokenController extends GetxController {
  static TokenController get to => Get.find();

  String token = "";

  /// 设置token
  void set() {
    token = mock.sentence();
    update();
  }

  /// 删除token
  void delete() {
    token = "";
    update();
  }
}
