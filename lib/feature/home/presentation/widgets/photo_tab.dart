import 'package:file_share/core/presentation/palette.dart';
import 'package:flutter/material.dart';

class PhotoTab extends StatefulWidget {
  const PhotoTab({super.key});

  @override
  State<PhotoTab> createState() => _PhotocardState();
}

class _PhotocardState extends State<PhotoTab> {
  bool buttonOne = true;
  bool buttonTwo = false;
  int selectedIndex = 0;
  bool photoIsSelected = false;

  void selectPhoto() {
    setState(() {
      photoIsSelected = !photoIsSelected;
    });
  }

  void toggle(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 0) {
      setState(() {
        buttonOne = true;
        buttonTwo = false;
      });
    } else {
      setState(() {
        buttonTwo = true;
        buttonOne = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
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
                  color: buttonOne ? Palette.blue : Colors.grey[300],
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('733'),
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
                  color: buttonTwo ? Palette.blue : Colors.grey[300],
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
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //3
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 30,
              itemBuilder: (context, index) => Container(
                alignment: Alignment.topRight,
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/cake.jpg'),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    selectPhoto();
                  },
                  icon: photoIsSelected
                      ? Icon(Icons.check_circle, color: Colors.white)
                      : Icon(Icons.circle_outlined, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
