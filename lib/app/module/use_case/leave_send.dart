import 'package:presensi_smkn1punggelan/app/domain/entity/leave.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/leave_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:presensi_smkn1punggelan/core/use_case/app_use_case.dart';

class LeaveSendUseCase extends AppUseCase<Future<DataState>, LeaveParamEntity> {
  final LeaveRepository _leaveRepository;

  LeaveSendUseCase(this._leaveRepository);

  @override
  Future<DataState> call({LeaveParamEntity? param}) {
    return _leaveRepository.sendLeave(param!);
  }
}
