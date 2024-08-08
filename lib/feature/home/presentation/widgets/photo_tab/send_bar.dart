import 'package:file_share/core/presentation/palette.dart';
import 'package:flutter/material.dart';

class SendBar extends StatelessWidget {
  final VoidCallback onPressed;
  final int selectedPhotos;
  const SendBar({
    super.key,
    required this.onPressed,
    required this.selectedPhotos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.close_rounded,
              color: Palette.blue,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Palette.blue,
                side: const BorderSide(style: BorderStyle.none)),
            onPressed: () {},
            child: Text(
              'Send ($selectedPhotos)',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
