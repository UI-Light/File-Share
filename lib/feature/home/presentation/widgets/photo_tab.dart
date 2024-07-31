import 'package:file_share/core/presentation/palette.dart';
import 'package:file_share/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

class PhotoTab extends StatefulWidget {
  const PhotoTab({super.key});

  @override
  State<PhotoTab> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  final HomeViewmodel homeViewmodel = HomeViewmodel();

  bool imagesButton = true;
  bool albumsButton = false;
  int selectedButtonIndex = 0;

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

  void toggle(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
    if (selectedButtonIndex == 0) {
      setState(() {
        imagesButton = true;
        albumsButton = false;
      });
    } else {
      setState(() {
        albumsButton = true;
        imagesButton = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    homeViewmodel.loadPhotos();
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
                  color: imagesButton ? Palette.blue : Colors.grey[300],
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
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: homeViewmodel.photos,
                builder: (context, photos, _) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      final photo = photos[index];

                      return FutureBuilder(
                        future: photo.thumbnailData,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                              height: 120,
                              width: 120,
                              color: Colors.grey[300],
                            );
                          }
                          if (snapshot.hasError) {
                            return Container(
                              height: 120,
                              width: 120,
                              color: Colors.grey[300],
                              child: const Center(
                                  child: Icon(Icons.broken_image_rounded)),
                            );
                          }
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
                              onPressed: () {
                                selectPhoto(index);
                                setState(() {});
                              },
                              icon: selectedPhotos.contains(index)
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.white)
                                  : const Icon(Icons.circle_outlined,
                                      color: Colors.white),
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
          ),
          //TODO: Animate(hide and pop up) send container
          if (selectedPhotos.isNotEmpty)
            Container(
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
                    onPressed: () {
                      selectedPhotos.clear();
                      setState(() {});
                    },
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
                      'Send (${selectedPhotos.length})',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
