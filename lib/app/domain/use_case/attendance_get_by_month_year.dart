import 'package:presensi_smkn1punggelan/app/domain/entity/attendance.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/attendance_param.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/attendance_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:presensi_smkn1punggelan/core/use_case/app_use_case.dart';

class AttendanceGetByMonthYear extends AppUseCase<
    Future<DataState<List<AttendanceEntity>>>, AttendanceParamGetEntity> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetByMonthYear(this._attendanceRepository);

  @override
  Future<DataState<List<AttendanceEntity>>> call(
      {AttendanceParamGetEntity? param}) {
    return _attendanceRepository.getByMonthYear(param!);
  }
}
