import 'package:presensi_smkn1punggelan/app/domain/entity/auth.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

abstract class AuthRepository {
  Future<DataState> login(AuthEntity param);
}
