import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Column(children: [
          Image.asset('assets/logo.png'),
          Text('Adobe Acrobat'),
          Text('26.43 MB'),
        ])),
      ],
    );
  }
}
