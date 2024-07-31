import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final VoidCallback onPressed;
  final bool isSelected;
  const PhotoCard({
    super.key,
    required this.snapshot,
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
          image: MemoryImage(snapshot.data!),
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
