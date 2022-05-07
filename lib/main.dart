import 'package:flutter/material.dart';
import 'package:flutter_dating_template/route.dart';
import 'package:flutter_dating_template/utils/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '社区交友APP',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: WcaoTheme.base,
            fontSize: WcaoTheme.fsXl,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(
            color: WcaoTheme.base,
            size: WcaoTheme.fsXl,
          ),
        ),
        primaryColor: WcaoTheme.primary,
        backgroundColor: Colors.transparent,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: WcaoTheme.fsBase),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        /// textButton 点击波纹
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),

        /// 取消slider间距
        sliderTheme: SliderThemeData(
          trackHeight: 12,
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: WcaoTheme.primary,
          inactiveTrackColor: WcaoTheme.primary.withOpacity(.2),
          thumbColor: WcaoTheme.primary,
          valueIndicatorColor: WcaoTheme.primary,
          inactiveTickMarkColor: WcaoTheme.primary,
        ),
      ),
      getPages: getRoutes,
      routes: routes,
      initialRoute: '/home',
      builder: EasyLoading.init(),
    );
  }
}
