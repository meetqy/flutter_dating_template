import 'package:flutter_dating_template/pages/agreement/privacy.dart';
import 'package:flutter_dating_template/pages/agreement/user.dart';
import 'package:flutter_dating_template/pages/history_match/index.dart';
import 'package:flutter_dating_template/pages/home/index.dart';
import 'package:flutter_dating_template/pages/home/message/chat/index.dart';
import 'package:flutter_dating_template/pages/home/mine/add_tag/index.dart';
import 'package:flutter_dating_template/pages/home/mine/fans/index.dart';
import 'package:flutter_dating_template/pages/home/mine/firends/index.dart';
import 'package:flutter_dating_template/pages/home/mine/visitors/index.dart';
import 'package:flutter_dating_template/pages/home/publish/index.dart';
import 'package:flutter_dating_template/pages/login/password.dart';
import 'package:flutter_dating_template/pages/login/verify_code.dart';
import 'package:flutter_dating_template/pages/settings/about/index.dart';
import 'package:flutter_dating_template/pages/settings/account/index.dart';
import 'package:flutter_dating_template/pages/settings/account/logout.dart';
import 'package:flutter_dating_template/pages/settings/account/update_phone.dart';
import 'package:flutter_dating_template/pages/settings/account/update_phone2.dart';
import 'package:flutter_dating_template/pages/settings/backlist/index.dart';
import 'package:flutter_dating_template/pages/settings/index.dart';
import 'package:flutter_dating_template/pages/settings/notification/index.dart';
import 'package:flutter_dating_template/pages/settings/password/reset.dart';
import 'package:flutter_dating_template/pages/settings/password/update.dart';
import 'package:flutter_dating_template/pages/settings/privacy/index.dart';
import 'package:flutter_dating_template/pages/verify_code/index.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> getRoutes = [
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/login/verify-code', page: () => const LoginVerifyCode()),
  GetPage(name: '/login/password', page: () => const LoginPassword()),
  GetPage(name: '/verify-code/:type', page: () => const VerifyCode()),
  GetPage(name: '/password/reset', page: () => const PasswordReset()),
  GetPage(name: '/password/update', page: () => const PasswordUpdate()),
  GetPage(name: '/agreement/user', page: () => const AgreementUser()),
  GetPage(name: '/agreement/privacy', page: () => const AgreementPrivacy()),
  GetPage(name: '/history-match', page: () => const HistoryMatch()),
  GetPage(name: '/settings', page: () => const Settings()),
  GetPage(name: '/settings/account', page: () => const SettingsAccount()),
  GetPage(
      name: '/settings/account/update-phone',
      page: () => const AccountUpdatePhone()),
  GetPage(
      name: '/settings/account/update-phone2',
      page: () => const AccountUpdatePhone2()),
  GetPage(name: '/settings/account/logout', page: () => const AccountLogout()),
  GetPage(
      name: '/settings/notification', page: () => const SettingsNotification()),
  GetPage(name: '/settings/privacy', page: () => const SettingsPrivacy()),
  GetPage(name: '/settings/backlist', page: () => const SettingsBacklist()),
  GetPage(name: '/settings/about', page: () => const SettingsAbout()),
  GetPage(name: "/mine/add-tag", page: () => const MineAddTag()),
  GetPage(name: "/mine/visitors", page: () => const MineVisitors()),
  GetPage(name: "/mine/firends", page: () => const MineFirends()),
  GetPage(name: "/mine/fans", page: () => const MineFans()),
  GetPage(name: "/message/chat", page: () => const MessageChat()),
  GetPage(name: "/publish", page: () => const Publish()),
];
