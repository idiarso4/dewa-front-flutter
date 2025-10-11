import 'package:presensi_smkn1punggelan/app/domain/entity/attendance_param.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/attendance_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:presensi_smkn1punggelan/core/use_case/app_use_case.dart';

class AttendanceSendUseCase
    extends AppUseCase<Future<DataState>, AttendanceParamEntity> {
  final AttendanceRepository _attendanceRepository;

  AttendanceSendUseCase(this._attendanceRepository);

  @override
  Future<DataState> call({AttendanceParamEntity? param}) {
    return _attendanceRepository.sendAttendance(param!);
  }
}
