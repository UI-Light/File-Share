import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, //3
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 30,
      itemBuilder: (context, index) => Container(
        //color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/logo.png',
                //scale: 1.5,
              ),
            ),
            const Text(
              'Adobe Acrobat',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const Text(
              '26.43 MB',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
