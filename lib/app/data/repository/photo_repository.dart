import 'dart:io';

import 'package:presensi_smkn1punggelan/app/data/source/photo_api_service.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/photo_repository.dart';
import 'package:presensi_smkn1punggelan/core/constant/constant.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoApiService _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<DataState<String>> getPhotoPath() {
    return handleResponse(
      () => _photoApiService.get(),
      (p0) => p0,
    );
  }

  @override
  Future<DataState<List<int>>> getPhotoBytes(String path) async {
    final response =
        await _photoApiService.getBytes(path: path.replaceAll(BASE_URL, ''));
    if (response.response.statusCode == HttpStatus.ok) {
      return SuccessState(data: response.response.data);
    } else {
      return ErrorState(
          message:
              '${response.response.statusCode} : ${response.response.statusMessage}');
    }
  }

  @override
  Future<String> savePhoto(List<int> bytes, String filename) async {
    // TODO: Implement save photo functionality
    // This should save the photo bytes to local storage and return the path
    throw UnimplementedError('savePhoto not yet implemented');
  }
}
