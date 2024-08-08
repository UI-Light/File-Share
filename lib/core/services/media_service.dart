import 'package:photo_manager/photo_manager.dart';

class MediaService {
  Future<void> requestMediaPermission() async {
    await PhotoManager.requestPermissionExtend();
  }

  Future<int> photoCount() async {
    final int count = await PhotoManager.getAssetCount(
      type: RequestType.image,
    );
    return count;
  }

  //TODO: work on pagination
  Future<List<AssetEntity>> fetchPhotos() async {
    await requestMediaPermission();
    final int count = await photoCount();
    final List<AssetEntity> photos =
        await PhotoManager.getAssetListPaged(page: 0, pageCount: count);
    return photos;
  }
}
