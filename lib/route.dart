import 'package:flutter_dating_template/pages/agreement/privacy.dart';
import 'package:flutter_dating_template/pages/agreement/user.dart';
import 'package:flutter_dating_template/pages/history_match/index.dart';
import 'package:flutter_dating_template/pages/home/index.dart';
import 'package:flutter_dating_template/pages/login/password.dart';
import 'package:flutter_dating_template/pages/login/verify_code.dart';
import 'package:flutter_dating_template/pages/settings/account/index.dart';
import 'package:flutter_dating_template/pages/settings/index.dart';
import 'package:flutter_dating_template/pages/settings/password/forget.dart';
import 'package:flutter_dating_template/pages/settings/password/new_set.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> getRoutes = [
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/login/verify-code', page: () => const LoginVerifyCode()),
  GetPage(name: '/login/password', page: () => const LoginPassword()),
  GetPage(name: '/password/forget', page: () => const PasswordForget()),
  GetPage(name: '/password/new-set', page: () => const PasswordNewSet()),
  GetPage(name: '/agreement/user', page: () => const AgreementUser()),
  GetPage(name: '/agreement/privacy', page: () => const AgreementPrivacy()),
  GetPage(name: '/history-match', page: () => const HistoryMatch()),
  GetPage(name: '/settings', page: () => const Settings()),
  GetPage(name: '/settings/accounts', page: () => const SettingsAccount()),
];
