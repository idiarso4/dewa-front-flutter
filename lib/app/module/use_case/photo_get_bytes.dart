import 'package:presensi_smkn1punggelan/app/domain/repository/photo_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:presensi_smkn1punggelan/core/use_case/app_use_case.dart';

class PhotoGetBytesUseCase
    extends AppUseCase<Future<DataState<dynamic>>, void> {
  final PhotoRepository _photoRepository;

  PhotoGetBytesUseCase(this._photoRepository);

  @override
  Future<DataState> call({void param}) async {
    final response = await _photoRepository.getPhotoPath();
    if (response.success) {
      final responseBytes =
          await _photoRepository.getPhotoBytes(response.data!);
      return responseBytes;
    } else {
      return response;
    }
  }
}
