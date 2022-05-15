import 'package:flutter/material.dart';
import 'package:flutter_dating_template/route.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wcao/ui/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    initialization();
  }

  void initialization() async {
    /// HACK: 启动页关闭
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '社区交友APP',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
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
            textStyle: MaterialStateProperty.all(
              TextStyle(color: WcaoTheme.primary),
            ),
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
      initialRoute: '/home',
      builder: EasyLoading.init(),
    );
  }
}
