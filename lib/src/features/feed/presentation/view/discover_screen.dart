import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/widgets.dart';


class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}