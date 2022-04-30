import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/login/password.dart';
import 'package:flutter_dating_template/pages/login/verify_code.dart';
import 'package:flutter_dating_template/pages/password/forget.dart';
import 'package:flutter_dating_template/pages/password/new_set.dart';

Map<String, WidgetBuilder> routes = {
  '/login/verify-code': (context) => const LoginVerifyCode(),
  '/login/password': (context) => const LoginPassword(),
  '/password/forget': (context) => const PasswordForget(),
  '/password/new-set': (context) => PasswordNewSet(),
};
