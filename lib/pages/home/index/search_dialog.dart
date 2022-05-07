import 'package:flutter/material.dart';
import 'package:flutter_dating_template/utils/theme.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  double age = 18;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .9,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbarTitle(context),
            body(),
          ],
        ),
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
          Container(
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
                      setState(() {
                        age = value;
                      });
                    },
                  ),
                )
              ],
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
          onPressed: () {},
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
