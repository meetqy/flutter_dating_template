import 'package:flutter_easyloading/flutter_easyloading.dart';

class UtillBase {
  static toast(String msg) async {
    await EasyLoading.showToast(msg);
  }
}
