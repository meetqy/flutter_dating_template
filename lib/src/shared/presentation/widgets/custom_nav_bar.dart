import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10,
      color: Colors.black,
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.goNamed('feed');
              },
              icon: const Icon(Icons.home),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                context.goNamed('name');
              },
              icon: const Icon(Icons.add_circle),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                context.goNamed('discover');
              },
              icon: const Icon(Icons.search),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
