import 'package:file_share/core/presentation/palette.dart';
import 'package:file_share/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/button_tabs.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/photo_card.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/photo_error_card.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/photo_loading_card.dart';
import 'package:file_share/feature/home/presentation/widgets/photo_tab/send_bar.dart';
import 'package:flutter/material.dart';

class PhotoTab extends StatefulWidget {
  const PhotoTab({super.key});

  @override
  State<PhotoTab> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  final HomeViewmodel homeViewmodel = HomeViewmodel();

  final ValueNotifier<List<int>> selectedPhotos = ValueNotifier([]);

  void selectPhoto(int index) {
    if (selectedPhotos.value.contains(index)) {
      selectedPhotos.value.remove(index);
      selectedPhotos.value = [...selectedPhotos.value];
    } else {
      selectedPhotos.value.add(index);
      selectedPhotos.value = [...selectedPhotos.value];
    }
  }

  @override
  void initState() {
    super.initState();
    homeViewmodel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: homeViewmodel.photosCount,
              builder: (context, count, _) {
                return ButtonTabs(
                  photoCount: count,
                );
              }),
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
                          return ValueListenableBuilder(
                              valueListenable: selectedPhotos,
                              builder: (context, photoList, _) {
                                return PhotoCard(
                                    snapshot: snapshot,
                                    isSelected: photoList.contains(index),
                                    onPressed: () {
                                      selectPhoto(index);
                                    });
                              });
                        },
                      );
                    },
                  );
                }),
          ),

          //TODO: Animate(hide and pop up) send bar
          ValueListenableBuilder(
            valueListenable: selectedPhotos,
            builder: (context, photoList, _) {
              if (photoList.isNotEmpty) {
                return SendBar(
                  onPressed: () {
                    selectedPhotos.value = [];
                  },
                  selectedPhotos: selectedPhotos.value.length,
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
