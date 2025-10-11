import 'package:presensi_smkn1punggelan/app/data/source/leave_api_service.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/leave.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/leave_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

class LeaveRepositoryImpl extends LeaveRepository {
  final LeaveApiService _leaveApiService;

  LeaveRepositoryImpl(this._leaveApiService);

  @override
  Future<DataState> sendLeave(LeaveParamEntity param) {
    return handleResponse(
      () => _leaveApiService.send(body: param.toJson()),
      (json) => null,
    );
  }
}
