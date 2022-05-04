import 'package:flutter/material.dart';
import 'package:flutter_dating_template/route.dart';
import 'package:flutter_dating_template/utils/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '社区交友APP',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: WcaoTheme.base,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(
            color: WcaoTheme.base,
            size: 18,
          ),
        ),
        primaryColor: WcaoTheme.primary,
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 14),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: routes,
      initialRoute: '/login/verify-code',
      builder: EasyLoading.init(),
    );
  }
}
