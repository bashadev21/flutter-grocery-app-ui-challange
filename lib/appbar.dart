import 'package:flutter/material.dart';

import 'home_screen.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: bgcolor,
      child: Row(
        children: [
          const BackButton(),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
              child: Text(
            'Fruits and Vegitables',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
