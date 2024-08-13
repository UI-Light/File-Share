import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  final String path;
  const DisplayPhoto({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topRight,
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(path),
          ),
        ),
      ),
    );
  }
}
