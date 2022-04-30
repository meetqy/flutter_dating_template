import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/login/forget_pwd.dart';
import 'package:flutter_dating_template/pages/login/password.dart';
import 'package:flutter_dating_template/pages/login/verify_code.dart';

Map<String, WidgetBuilder> routes = {
  '/verify-code-login': (context) => const VerifyCodeLogin(),
  '/password-login': (context) => const PasswordLogin(),
  '/forget-password': (context) => ForgetPassWord()
};
