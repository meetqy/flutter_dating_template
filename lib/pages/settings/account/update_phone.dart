import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/theme.dart';
import 'package:get/get.dart';

/// HACK: 账号设置-验证当前手机号

class AccountUpdatePhone extends StatefulWidget {
  const AccountUpdatePhone({Key? key}) : super(key: key);

  @override
  State<AccountUpdatePhone> createState() => _AccountUpdatePhoneState();
}

class _AccountUpdatePhoneState extends State<AccountUpdatePhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '更换手机号',
                style: TextStyle(
                  fontSize: WcaoTheme.fsBase * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  '更换新手机号后，请重新登录APP',
                  style: TextStyle(color: WcaoTheme.secondary),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 48),
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: "请输入手机号码",
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
                onTap: () {
                  Get.toNamed('/verify-code/update_phone');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 36),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: WcaoTheme.primary,
                    borderRadius: WcaoTheme.radius,
                  ),
                  child: const Text(
                    '更换',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
