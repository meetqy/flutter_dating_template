import 'package:flutter/material.dart';
import 'package:flutter_dating_template/state/token.dart';
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:get/get.dart';

class AccountLogout extends StatefulWidget {
  const AccountLogout({Key? key}) : super(key: key);

  @override
  State<AccountLogout> createState() => _AccountLogoutState();
}

class _AccountLogoutState extends State<AccountLogout> {
  List<String> texts = [
    '用户按照页面给与的提示完成全部注册步骤后，即成为知闻的用户，用户应自行保管账号及密码，并准确、安全地使用其账号及密码。知闻可通过用户自行设定，向用户提供个性化信息服务。',
    '用户充分了解并同意，本平台为用户提供个性化信息服务，用户须为自己注册账号下的行为负责，包括用户所导入、上载、传送的任何内容以及由此产生的任何后果，用户应对知闻中的内容自行加以判断，并承担因使用内容而引起的所有风险。知闻不对因用户行为而导致的损失承担责任。',
    "任何由于黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营的不可抗力而造成的个人资料泄露、丢失、被盗用或被窜改等，本 APP 平台均得免责",
    "用户提供的个人信息或发布的信息不真实、不准确、不合法；发表内容不符合本协议或发表内容不符合法律法规的，知闻有权暂停或终止用户使用本平台的服务。用户如果对知闻的暂停或者终止或收回其账号行为有异议，客户可向平台提出意见，要求其继续提供服务。知闻收到客户此类信息的投诉与意见，会审核相关信息，并及时对用户给予反馈。若信息确实不真实或不准确或不合法有效，知闻平台要求用户提供符合要求的信息。",
    "本 APP 平台使用者因为违反本声明的规定而触犯中华人民共和国法律的，一切后果自己负责，本 APP 平台不承担任何责任。",
    "本 APP 平台不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本 APP 平台实际控制的任何网页或平台上的内容，本 APP 平台不承担任何责任。"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('账号注销'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '在您确定注销前，请仔细阅读以下内容',
                  style: TextStyle(
                    fontSize: WcaoTheme.fsBase * 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: texts
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: WcaoTheme.fsL,
                              height: 1.75,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                InkWell(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('确认注销？'),
                      content: const Text('注销了账号，数据将无法找回'),
                      buttonPadding: EdgeInsets.zero,
                      actions: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  Get.back();
                                  await WcaoUtils.loading(msg: "注销中...");
                                  TokenController.to.delete();
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  WcaoUtils.dismiss();
                                  Get.offAllNamed('/login/verify-code');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        width: .5,
                                        color: WcaoTheme.outline,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    '注销账号',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: WcaoTheme.fsL,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => Get.back(),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        width: .5,
                                        color: WcaoTheme.outline,
                                      ),
                                    ),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    '取消',
                                    style: TextStyle(
                                      color: WcaoTheme.primary,
                                      fontSize: WcaoTheme.fsL,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      actionsPadding: EdgeInsets.zero,
                    ),
                  ),
                  // onTap: () async {

                  //   await WcaoUtils.loading();
                  //   TokenController.to.delete();
                  //   await Future.delayed(const Duration(seconds: 2));
                  //   WcaoUtils.dismiss();
                  //   Get.offAllNamed('/login/verify-code');
                  // },
                  child: Container(
                    margin: const EdgeInsets.only(top: 36),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: WcaoTheme.radius,
                    ),
                    child: const Text(
                      '确认注销',
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
      ),
    );
  }
}
