import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/theme.dart';

class PasswordForget extends StatefulWidget {
  const PasswordForget({Key? key}) : super(key: key);

  @override
  State<PasswordForget> createState() => _ForgetPassWordState();
}

class _ForgetPassWordState extends State<PasswordForget> {
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
                  '验证码已发送',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: WcaoTheme.base,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    '+ 18888888888',
                    style: TextStyle(color: WcaoTheme.secondary),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 36),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    maxLength: 6,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "请输入验证码",
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/password/new-set');
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
      ),
    );
  }
}
