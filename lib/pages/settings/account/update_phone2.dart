import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:get/get.dart';

/// HACK: 账号设置-更换手机号

class AccountUpdatePhone2 extends StatefulWidget {
  const AccountUpdatePhone2({Key? key}) : super(key: key);

  @override
  State<AccountUpdatePhone2> createState() => _AccountUpdatePhone2State();
}

class _AccountUpdatePhone2State extends State<AccountUpdatePhone2> {
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
                  '请填写重新绑定的手机号',
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
                onTap: () async {
                  await WcaoUtils.toast('更换成功');
                  Get.toNamed('/login/verify-code');
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
