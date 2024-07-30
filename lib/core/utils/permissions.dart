import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissions {
  Future<void> grantPermissions() async {
    try {
      final bool videosGranted = await Permission.videos.isGranted;
      final bool photosGranted = await Permission.photos.isGranted;
      final bool audioGranted = await Permission.audio.isGranted;

      if (!photosGranted || !videosGranted || !audioGranted) {
        final Map<Permission, PermissionStatus> statuses = await [
          Permission.videos,
          Permission.photos,
          Permission.audio,
        ].request();

        if (statuses[Permission.videos] == PermissionStatus.permanentlyDenied ||
            statuses[Permission.photos] == PermissionStatus.permanentlyDenied ||
            statuses[Permission.audio] == PermissionStatus.permanentlyDenied) {
          await openAppSettings();
        }
      }
    } catch (e) {
      debugPrint('Error granting permissions: $e');
    }
  }
}
