import 'package:flutter/material.dart';
import 'package:flutter_dating_template/utils/theme.dart';

class SearchDialog extends StatefulWidget {
  SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .9,
      child: SafeArea(
        child: Column(
          children: [
            appbarTitle(context),
          ],
        ),
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
