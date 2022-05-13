import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/kit/theme.dart';
import 'package:get/get.dart';

class AgreementPrivacy extends StatefulWidget {
  const AgreementPrivacy({Key? key}) : super(key: key);

  @override
  State<AgreementPrivacy> createState() => _AgreementPrivacyState();
}

class _AgreementPrivacyState extends State<AgreementPrivacy> {
  List<String> txt = [
    "用户按照页面给与的提示完成全部注册步骤后，即成为我们的用户，用户应自行保管账号及密码，并准确、安全地使用其账号及密码。可通过用户自行设定，向用户提供个性化信息服务。",
    "用户充分了解并同意，本平台为用户提供个性化信息服务，用户须为自己注册账号下的行为负责，包括用户所导入、上载、传送的任何内容以及由此产生的任何后果，用户应对内容自行加以判断，并承担因使用内容而引起的所有风险。我们不对因用户行为而导致的损失承担责任。",
    "任何由于黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营的不可抗力而造成的个人资料泄露、丢失、被盗用或被窜改等，本 APP 平台均得免责",
    "用户提供的个人信息或发布的信息不真实、不准确、不合法；发表内容不符合本协议或发表内容不符合法律法规的，我们有权暂停或终止用户使用本平台的服务。用户如果对本 APP的暂停或者终止或收回其账号行为有异议，客户可向平台提出意见，要求其继续提供服务。我们收到客户此类信息的投诉与意见，会审核相关信息，并及时对用户给予反馈。若信息确实不真实或不准确或不合法有效，本平台要求用户提供符合要求的信息。",
    "本 APP 平台使用者因为违反本声明的规定而触犯中华人民共和国法律的，一切后果自己负责，本 APP 平台不承担任何责任。",
    "本 APP 平台不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本 APP 平台实际控制的任何网页或平台上的内容，本 APP 平台不承担任何责任。",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("隐私政策"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 16, color: WcaoTheme.base),
              child: Column(
                children: txt
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
