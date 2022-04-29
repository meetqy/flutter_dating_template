import 'package:flutter/material.dart';
import 'package:flutter_dating_template/utils/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          margin: const EdgeInsets.only(bottom: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '登录/注册',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: WcaoTheme.base,
                ),
              ),
              buildPhone(),
              buildVerifyCode(),
              buildLogin(),
              Container(
                margin: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                child: Text(
                  '密码登录',
                  style: TextStyle(
                    color: WcaoTheme.primaryFocus,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "登录即同意",
                      style: TextStyle(color: WcaoTheme.placeholder),
                    ),
                    InkWell(child: const Text('《用户协议》'), onTap: () {}),
                    Text(
                      "及",
                      style: TextStyle(color: WcaoTheme.placeholder),
                    ),
                    InkWell(child: const Text('《隐私政策》'), onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildLogin() {
    return InkWell(
      onTap: () {
        // TODO: login
      },
      child: Container(
        margin: const EdgeInsets.only(top: 36),
        alignment: Alignment.center,
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: WcaoTheme.primary,
          borderRadius: WcaoTheme.radius,
        ),
        child: const Text(
          '登录',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  /// 手机号
  Column buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 36),
          child: Wrap(
            children: [
              Text(
                '手机号码',
                style: TextStyle(
                  fontSize: 14,
                  color: WcaoTheme.placeholder,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WcaoTheme.outline,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WcaoTheme.primaryFocus,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 验证码
  Column buildVerifyCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Wrap(
            children: [
              Text(
                '验证码',
                style: TextStyle(
                  fontSize: 14,
                  color: WcaoTheme.placeholder,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: WcaoTheme.outline,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: WcaoTheme.primaryFocus,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  // print('123s');
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    "获取验证码",
                    style: TextStyle(
                      fontSize: 14,
                      color: WcaoTheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
