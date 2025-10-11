import 'package:presensi_smkn1punggelan/app/domain/entity/attendance.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/attendance_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:presensi_smkn1punggelan/core/use_case/app_use_case.dart';

class AttendanceGetTodayUseCase
    extends AppUseCase<Future<DataState<AttendanceEntity?>>, void> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetTodayUseCase(this._attendanceRepository);

  @override
  Future<DataState<AttendanceEntity?>> call({void param}) {
    return _attendanceRepository.getToday();
  }
}
