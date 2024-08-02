import 'package:file_share/core/presentation/palette.dart';
import 'package:flutter/material.dart';

class ButtonTabs extends StatefulWidget {
  final int photoCount;
  const ButtonTabs({
    super.key,
    required this.photoCount,
  });

  @override
  State<ButtonTabs> createState() => _ButtonTabsState();
}

class _ButtonTabsState extends State<ButtonTabs> {
  bool imagesButton = true;
  bool albumsButton = false;
  int selectedButtonIndex = 0;

  void toggle(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
    if (selectedButtonIndex == 0) {
      imagesButton = true;
      albumsButton = false;
    } else {
      albumsButton = true;
      imagesButton = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            toggle(0);
            print('this is image');
          },
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width / 2.5,
            color: imagesButton ? Palette.blue : Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.image),
                const SizedBox(
                  width: 8.0,
                ),
                Text(widget.photoCount.toString())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            toggle(1);
            print('this is album');
          },
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width / 2.5,
            color: albumsButton ? Palette.blue : Colors.grey[300],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_library),
                SizedBox(
                  width: 8.0,
                ),
                Text('23'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
