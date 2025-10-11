import 'package:presensi_smkn1punggelan/app/domain/entity/attendance.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/attendance_param.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

abstract class AttendanceRepository {
  Future<DataState<AttendanceEntity?>> getToday();
  Future<DataState<List<AttendanceEntity>>> getThisMonth();
  Future<DataState> sendAttendance(AttendanceParamEntity param);
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param);
}
