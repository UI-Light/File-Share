import 'package:file_share/core/services/media_service.dart';
import 'package:flutter/material.dart';

class HomeViewmodel {
  ValueNotifier<List> _photos = ValueNotifier([]);
  ValueNotifier<List> get photos => _photos;

  final MediaService _mediaService = MediaService();
  void loadPhotos() async {
    _photos.value = await _mediaService.fetchPhotos();
  }
}
