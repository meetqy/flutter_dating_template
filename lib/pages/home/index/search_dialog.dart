import 'package:flutter/material.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:group_button/group_button.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  double age = 18;
  List<String> sex = ['男', '女', '不限'];
  List<String> edu = ["小学", "初中", "高中", "大学"];
  List<String> constellation = [
    "白羊",
    "金牛",
    "双子",
    "巨蟹",
    "狮子",
    "处女",
    "天秤",
    "天蝎",
    "射手",
    "摩羯",
    "水瓶",
    "双鱼",
  ];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbarTitle(context),
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: body(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              '基础条件',
              style: TextStyle(color: WcaoTheme.secondary),
            ),
          ),
          setAge(),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Text(
              '其他条件',
              style: TextStyle(color: WcaoTheme.secondary),
            ),
          ),
          setSex(),
          setEdu(),
          setConstellation()
        ],
      ),
    );
  }

  /// 星座
  Column setConstellation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Text(
            '星座',
            style: TextStyle(fontSize: WcaoTheme.fsL),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: GroupButton(
            isRadio: false,
            buttons: constellation,
            options: groupButtonOptions(),
          ),
        )
      ],
    );
  }

  /// 学历
  Column setEdu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Text(
            '学历',
            style: TextStyle(fontSize: WcaoTheme.fsL),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: GroupButton(
            buttons: edu,
            options: groupButtonOptions(),
          ),
        )
      ],
    );
  }

  /// 性别
  Column setSex() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Text(
            '性别',
            style: TextStyle(fontSize: WcaoTheme.fsL),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: GroupButton(
            buttons: sex,
            options: groupButtonOptions(),
          ),
        )
      ],
    );
  }

  /// group button 默认设置
  GroupButtonOptions groupButtonOptions() {
    return GroupButtonOptions(
      elevation: 0,
      mainGroupAlignment: MainGroupAlignment.start,
      textPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      runSpacing: 0,
      spacing: 12,
      borderRadius: BorderRadius.circular(6),
      unselectedColor: WcaoTheme.outline.withOpacity(.25),
      selectedColor: WcaoTheme.primary.withOpacity(.2),
      unselectedBorderColor: WcaoTheme.outline,
      selectedBorderColor: WcaoTheme.primary,
      unselectedTextStyle: TextStyle(
        color: WcaoTheme.base.withOpacity(.85),
        fontSize: WcaoTheme.fsSm,
      ),
      selectedTextStyle: TextStyle(
        color: WcaoTheme.primary,
        fontSize: WcaoTheme.fsSm,
      ),
    );
  }

  Container setAge() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '年龄',
                style: TextStyle(
                  fontSize: WcaoTheme.fsL,
                ),
              ),
              Text(
                "18-45",
                style: TextStyle(
                  fontSize: WcaoTheme.fsL,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Slider(
              min: 18,
              max: 45,
              value: age,
              divisions: 27,
              label: age.round().toString(),
              onChanged: (value) {
                /// HACK: 设置年龄
                setState(() {
                  age = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  AppBar appbarTitle(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        '筛选条件',
        style: TextStyle(
          fontSize: WcaoTheme.fsXl,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            /// HACK: 匹配条件确认
            Navigator.pop(context);
          },
          child: Text(
            '确定',
            style: TextStyle(
              color: WcaoTheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
