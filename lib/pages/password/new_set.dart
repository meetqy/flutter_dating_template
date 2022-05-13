import 'package:flutter/material.dart';
import 'package:flutter_wcao/kit/index.dart';
import 'package:flutter_wcao/ui/theme.dart';

class PasswordNewSet extends StatefulWidget {
  const PasswordNewSet({Key? key}) : super(key: key);

  @override
  State<PasswordNewSet> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<PasswordNewSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          margin: const EdgeInsets.only(bottom: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '设置新密码',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: WcaoTheme.base,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  '密码至少8位，包含数字/字母/字符组合',
                  style: TextStyle(color: WcaoTheme.secondary),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 36),
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "请输入新密码",
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
              InkWell(
                onTap: () async {
                  await WcaoUtils.toast('密码重置成功！');
                  Navigator.pushNamed(context, '/login/password');
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 36),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: WcaoTheme.radius,
                    color: WcaoTheme.primary,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '确认',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
