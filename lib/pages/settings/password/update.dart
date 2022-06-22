import 'package:flutter/material.dart';
import 'package:flutter_dating_template/state/token.dart';
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:get/get.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({Key? key}) : super(key: key);

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("修改密码"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "请输入原密码",
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
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "请输入新密码",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
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
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "再次输入密码",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
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
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '密码至少8位，包含数字/字母/字符组合',
                        style: TextStyle(color: WcaoTheme.secondary),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/password/forget'),
                        child: Text(
                          "忘记密码？",
                          style: TextStyle(color: WcaoTheme.primary),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await WcaoUtils.toast('密码重置成功');
                    TokenController.to.delete();
                    Get.offAllNamed('/login/password');
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
        ));
  }
}
