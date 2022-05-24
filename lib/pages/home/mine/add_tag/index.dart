import 'package:flutter/material.dart';
import 'package:flutter_wcao/ui/tag.dart';
import 'package:flutter_wcao/ui/theme.dart';

class MineAddTag extends StatefulWidget {
  const MineAddTag({Key? key}) : super(key: key);

  @override
  State<MineAddTag> createState() => _MineAddTagState();
}

class _MineAddTagState extends State<MineAddTag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('添加标签'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '完成',
              style: TextStyle(color: WcaoTheme.base),
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                color: WcaoTheme.primary.withOpacity(.25),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(
                    12,
                    (index) => Tag(
                      '乐观注意',
                      backgroundColor: WcaoTheme.primary,
                      color: Colors.white,
                      close: true,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 6,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  labelStyle: const TextStyle(fontWeight: FontWeight.normal),
                  labelColor: WcaoTheme.primary,
                  unselectedLabelColor: WcaoTheme.base,
                  indicatorColor: WcaoTheme.primary,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
                  tabs: const [
                    Tab(text: '星座'),
                    Tab(text: '年代'),
                    Tab(text: '兴趣'),
                    Tab(text: '特质'),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: tabbarView1(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: tabbarView2(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: tabbarView3(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: tabbarView4(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Wrap tabbarView4() {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(
        16,
        (index) => Tag(
          '长得帅',
          border: Border.all(width: .5, color: WcaoTheme.outline),
          backgroundColor: Colors.white,
          color: WcaoTheme.base,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  Wrap tabbarView3() {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(
        16,
        (index) => Tag(
          '钓鱼',
          border: Border.all(width: .5, color: WcaoTheme.outline),
          backgroundColor: Colors.white,
          color: WcaoTheme.base,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  Wrap tabbarView2() {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(
        16,
        (index) => Tag(
          '90年代',
          border: Border.all(width: .5, color: WcaoTheme.outline),
          backgroundColor: Colors.white,
          color: WcaoTheme.base,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  Wrap tabbarView1() {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(
        16,
        (index) => Tag(
          '双鱼座',
          border: Border.all(width: .5, color: WcaoTheme.outline),
          backgroundColor: Colors.white,
          color: WcaoTheme.base,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
