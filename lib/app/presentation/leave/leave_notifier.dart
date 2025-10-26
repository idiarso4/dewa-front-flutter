import 'package:presensi_smkn1punggelan/app/domain/entity/leave.dart';
import 'package:presensi_smkn1punggelan/app/domain/use_case/leave_send.dart';
import 'package:presensi_smkn1punggelan/core/provider/app_provider.dart';
import 'package:flutter/material.dart';

class LeaveNotifier extends AppProvider {
  final LeaveSendUseCase _leaveSendUseCase;
  LeaveNotifier(this._leaveSendUseCase) {
    init();
  }

  bool _isSuccess = false;
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  bool get isSuccess => _isSuccess;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;
  TextEditingController get reasonController => _reasonController;

  @override
  void init() {
    _isSuccess = false;
    _startDateController.clear();
    _endDateController.clear();
    _reasonController.clear();
    notifyListeners();
  }

  send() async {
    showLoading();
    final param = LeaveParamEntity(
        startDate: _startDateController.text,
        endDate: _endDateController.text,
        reason: _reasonController.text);
    final response = await _leaveSendUseCase(param: param);
    if (response.success) {
      _isSuccess = true;
    } else {
      snackbarMessage = response.message;
    }
    hideLoading();
  }
}
