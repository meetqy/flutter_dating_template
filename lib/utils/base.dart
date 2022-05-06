import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_template/utils/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UtillBase {
  static toast(String msg) async {
    await EasyLoading.showToast(msg);
  }

  /// https://pub.flutter-io.cn/packages/cached_network_image
  /// 缓存图片
  static imageCache(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      placeholder: (context, url) => CupertinoActivityIndicator(
        color: WcaoTheme.primary,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.redAccent,
      ),
    );
  }
}
