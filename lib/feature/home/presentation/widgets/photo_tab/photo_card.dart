import 'package:flutter/material.dart';

class PhotoCard extends StatefulWidget {
  final int index;
  final AsyncSnapshot snapshot;
  const PhotoCard({
    super.key,
    required this.index,
    required this.snapshot,
  });

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  List<int> selectedPhotos = [];

  void selectPhoto(int index) {
    if (selectedPhotos.contains(index) == true) {
      selectedPhotos.remove(index);
      print(selectedPhotos);
    } else {
      selectedPhotos.add(index);
      print(selectedPhotos);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(widget.snapshot.data!),
        ),
      ),
      child: IconButton(
        onPressed: () {
          selectPhoto(widget.index);
          setState(() {});
        },
        icon: selectedPhotos.contains(widget.index)
            ? const Icon(Icons.check_circle, color: Colors.white)
            : const Icon(Icons.circle_outlined, color: Colors.white),
      ),
    );
  }
}
