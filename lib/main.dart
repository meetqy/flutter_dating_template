import 'package:flutter/material.dart';
import 'package:flutter_dating_template/route.dart';
import 'package:flutter_dating_template/utils/theme.dart';

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
        primaryColor: WcaoTheme.primary,
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 14),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: routes,
      initialRoute: '/verify-code-login',
    );
  }
}
