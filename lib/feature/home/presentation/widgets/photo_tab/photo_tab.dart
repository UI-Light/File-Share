import 'package:file_share/core/presentation/palette.dart';
import 'package:file_share/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/button_tabs.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/photo_card.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/photo_error_card.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/photo_loading_card.dart';
import 'package:flutter/material.dart';

class PhotoTab extends StatefulWidget {
  const PhotoTab({super.key});

  @override
  State<PhotoTab> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  final HomeViewmodel homeViewmodel = HomeViewmodel();

  List<int> selectedPhotos = [];

  void selectPhoto(int index) {
    if (selectedPhotos.contains(index)) {
      selectedPhotos.remove(index);
      print(selectedPhotos);
    } else {
      selectedPhotos.add(index);
      print(selectedPhotos);
    }
    setState(() {});
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
          const ButtonTabs(),
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
                            return const PhotoLoadingCard();
                          }
                          if (snapshot.hasError) {
                            return const PhotoErrorCard();
                          }
                          return PhotoCard(
                              snapshot: snapshot,
                              isSelected: selectedPhotos.contains(index),
                              onPressed: () {
                                selectPhoto(index);
                              });
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
