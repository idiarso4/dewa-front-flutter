import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

abstract class PhotoRepository {
  Future<DataState<String>> getPhotoPath();
  Future<DataState<List<int>>> getPhotoBytes(String path);
  Future<String> savePhoto(List<int> bytes, String filename);
}
