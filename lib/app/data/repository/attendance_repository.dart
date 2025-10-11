import 'package:presensi_smkn1punggelan/app/data/model/attendance.dart';
import 'package:presensi_smkn1punggelan/app/data/model/attendance_response.dart';
import 'package:presensi_smkn1punggelan/app/data/source/attendance_api_service.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/attendance.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/attendance_param.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/attendance_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceApiService _attendanceApiService;

  AttendanceRepositoryImpl(this._attendanceApiService);

  @override
  Future<DataState<List<AttendanceEntity>>> getThisMonth() {
    return handleResponse(
      () => _attendanceApiService.getAttendanceToday(),
      (json) {
        final response = AttendanceResponse.fromJson(json);
        return response.thisMonth.map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<DataState<AttendanceEntity?>> getToday() {
    return handleResponse(
      () => _attendanceApiService.getAttendanceToday(),
      (json) {
        final response = AttendanceResponse.fromJson(json);
        return response.today?.toEntity();
      },
    );
  }

  @override
  Future<DataState> sendAttendance(AttendanceParamEntity param) {
    return handleResponse(
      () => _attendanceApiService.sendAttendance(body: param.toJson()),
      (json) => null,
    );
  }

  @override
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param) {
    return handleResponse(
      () => _attendanceApiService.getAttendanceByMonthYear(
          month: param.month.toString(), year: param.year.toString()),
      (json) => List<AttendanceEntity>.from(
          json.map((item) => AttendanceModel.fromJson(item).toEntity())),
    );
  }
}
