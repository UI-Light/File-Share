import 'package:file_share/core/presentation/palette.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Icon icon;
  final String iconText;

  const ActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.iconText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Palette.blue,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Column(
            children: [
              Icon(
                icon.icon,
                size: 30,
                color: Colors.white,
              ),
              Text(
                iconText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
