import 'package:photo_manager/photo_manager.dart';

class MediaService {
  Future<List<AssetEntity>> fetchPhotos() async {
    final int count = await PhotoManager.getAssetCount(
      type: RequestType.image,
    );

    final List<AssetEntity> photos =
        await PhotoManager.getAssetListPaged(page: 0, pageCount: count);
    return photos;
  }
}
