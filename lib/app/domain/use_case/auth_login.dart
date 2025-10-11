import 'package:presensi_smkn1punggelan/app/domain/entity/auth.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/auth_param.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/auth_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:presensi_smkn1punggelan/core/use_case/app_use_case.dart';

class AuthLoginUseCase
    extends AppUseCase<Future<DataState<AuthEntity>>, AuthLoginParamEntity> {
  final AuthRepository _authRepository;

  AuthLoginUseCase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call({AuthLoginParamEntity? param}) {
    return _authRepository.login(param!);
  }
}
