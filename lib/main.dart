import 'package:flutter/material.dart';
import 'package:flutter_dating_template/src/config/app_router.dart';
import 'package:flutter_dating_template/src/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '',
      theme: CustomTheme().theme(),
      routerConfig: AppRouter().router,
    );
  }
}
