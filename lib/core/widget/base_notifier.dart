import 'package:presensi_smkn1punggelan/core/provider/app_provider.dart';

abstract class BaseNotifier extends AppProvider {
  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;
  bool get isError => errorMessage.isNotEmpty;

  void setStateLoading() {
    showLoading();
    _isSuccess = false;
    errorMeesage = '';
  }

  void setStateSuccess() {
    hideLoading();
    _isSuccess = true;
    errorMeesage = '';
  }

  void setStateError(String message) {
    hideLoading();
    _isSuccess = false;
    errorMeesage = message;
  }

  void resetState() {
    hideLoading();
    _isSuccess = false;
    errorMeesage = '';
  }
}
