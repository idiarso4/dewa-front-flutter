import 'package:presensi_smkn1punggelan/app/data/model/auth.dart';
import 'package:presensi_smkn1punggelan/app/data/source/auth_api_service.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/auth.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/auth_param.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/auth_repository.dart';
import 'package:presensi_smkn1punggelan/core/constant/constant.dart';
import 'package:presensi_smkn1punggelan/core/helper/shared_preferences_helper.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<AuthEntity>> login(AuthLoginParamEntity param) {
    return handleResponse(
      () => _authApiService
          .login(body: {'email': param.email, 'password': param.password}),
      (json) async {
        final authModel = AuthModel.fromJson(json);
        await SharedPreferencesHelper.setString(
            PREF_AUTH, '${authModel.tokenType} ${authModel.accessToken}');
        await SharedPreferencesHelper.setInt(PREF_ID, authModel.user.id);
        await SharedPreferencesHelper.setString(PREF_NAME, authModel.user.name);
        await SharedPreferencesHelper.setString(
            PREF_EMAIL, authModel.user.email);
        return authModel.toEntity();
      },
    );
  }
}
