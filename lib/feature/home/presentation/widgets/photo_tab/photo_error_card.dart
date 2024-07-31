import 'package:flutter/material.dart';

class PhotoErrorCard extends StatelessWidget {
  const PhotoErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      color: Colors.grey[300],
      child: const Center(child: Icon(Icons.broken_image_rounded)),
    );
  }
}
