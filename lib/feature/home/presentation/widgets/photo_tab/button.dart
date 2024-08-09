import 'package:file_share/core/presentation/palette.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final int count;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;
  const Button({
    super.key,
    required this.count,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width / 2.5,
        color: isSelected ? Palette.blue : Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 8.0,
            ),
            Text(count.toString()),
          ],
        ),
      ),
    );
  }
}
