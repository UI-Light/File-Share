import 'package:file_share/core/services/media_service.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class HomeViewmodel {
  final ValueNotifier<List<AssetEntity>> _photos = ValueNotifier([]);
  ValueNotifier<List<AssetEntity>> get photos => _photos;

  final MediaService _mediaService = MediaService();

  void loadPhotos() async {
    _photos.value = await _mediaService.fetchPhotos();
  }
}
