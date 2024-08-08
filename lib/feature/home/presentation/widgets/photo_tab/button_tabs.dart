import 'package:file_share/feature/home/presentation/widgets/photo_tab/button.dart';
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
  int selectedButtonIndex = 0;

  void toggle(int index) {
    selectedButtonIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button(
          count: widget.photoCount,
          icon: Icons.image,
          isSelected: selectedButtonIndex == 0,
          onPressed: () {
            toggle(0);
            print('This is image');
          },
        ),
        Button(
          count: 23,
          icon: Icons.photo_library,
          isSelected: selectedButtonIndex == 1,
          onPressed: () {
            toggle(1);
            print('This is album');
          },
        ),
      ],
    );
  }
}
