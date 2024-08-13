import 'dart:typed_data';

import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final Uint8List imageBytes;
  final VoidCallback onPressed;
  final bool isSelected;
  const PhotoCard({
    super.key,
    required this.imageBytes,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(imageBytes),
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          isSelected ? Icons.check_circle : Icons.circle_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
