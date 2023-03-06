import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

const assetHost = 'https://rao.pics/r';

class WcaoUtils {
  /// toast
  static toast(String msg) async {
    await EasyLoading.showToast(msg);
  }

  /// loading
  static loading({String? msg}) async {
    await EasyLoading.show(status: msg ?? "loading...");
  }

  /// 关闭loading
  static dismiss() {
    EasyLoading.dismiss();
  }

  /// https://pub.flutter-io.cn/packages/cached_network_image
  /// 缓存图片
  static Widget imageCache(String url, {BoxFit? fit}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.fill,
      placeholder: (context, url) => CupertinoActivityIndicator(
        color: WcaoTheme.primary,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.redAccent,
      ),
    );
  }

  static String getRandomImage() {
    return '$assetHost?t=${DateTime.now()}';
  }
}
