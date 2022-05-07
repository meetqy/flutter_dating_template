import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/agreement/privacy.dart';
import 'package:flutter_dating_template/pages/agreement/user.dart';
import 'package:flutter_dating_template/pages/home/index.dart';
import 'package:flutter_dating_template/pages/login/password.dart';
import 'package:flutter_dating_template/pages/login/verify_code.dart';
import 'package:flutter_dating_template/pages/password/forget.dart';
import 'package:flutter_dating_template/pages/password/new_set.dart';
import 'package:get/get.dart';

Map<String, WidgetBuilder> routes = {
  '/home': (context) => const Home(),
  '/login/verify-code': (context) => const LoginVerifyCode(),
  '/login/password': (context) => const LoginPassword(),
  '/password/forget': (context) => const PasswordForget(),
  '/password/new-set': (context) => const PasswordNewSet(),
  '/agreement/user': (context) => const AgreementUser(),
  '/agreement/privacy': (context) => const AgreementPrivacy(),
};

List<GetPage<dynamic>> getRoutes = [
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/login/verify-code', page: () => const LoginVerifyCode()),
  GetPage(name: '/login/password', page: () => const LoginPassword()),
  GetPage(name: '/password/forget', page: () => const PasswordForget()),
  GetPage(name: '/password/new-set', page: () => const PasswordNewSet()),
  GetPage(name: '/agreement/user', page: () => const AgreementUser()),
  GetPage(name: '/agreement/privacy', page: () => const AgreementPrivacy()),
];
