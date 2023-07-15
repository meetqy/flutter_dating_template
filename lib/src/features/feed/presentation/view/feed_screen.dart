import 'package:flutter/material.dart';
import 'package:flutter_dating_template/src/shared/presentation/widgets/widgets.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}