import 'package:file_share/core/services/media_service.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class HomeViewmodel {
  final MediaService _mediaService = MediaService();

  final ValueNotifier<List<AssetEntity>> _photos = ValueNotifier([]);
  ValueNotifier<List<AssetEntity>> get photos => _photos;

  final ValueNotifier<int> _photosCount = ValueNotifier(0);
  ValueNotifier<int> get photosCount => _photosCount;

  Future<void> permission() async {
    await _mediaService.getPermission();
  }

  Future<void> loadPhotos() async {
    _photos.value = await _mediaService.fetchPhotos();
  }

  Future<void> showPhotoCount() async {
    _photosCount.value = await _mediaService.photoCount();
  }

  void initialize() async {
    await permission();
    await showPhotoCount();
    await loadPhotos();
  }
}
