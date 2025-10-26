import 'package:presensi_smkn1punggelan/app/domain/entity/attendance.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/schedule.dart';
import 'package:presensi_smkn1punggelan/app/domain/use_case/attendance_get_this_month.dart';
import 'package:presensi_smkn1punggelan/app/domain/use_case/attendance_get_today.dart';
import 'package:presensi_smkn1punggelan/app/domain/use_case/schedule_get.dart';
import 'package:presensi_smkn1punggelan/core/constant/constant.dart';
import 'package:presensi_smkn1punggelan/core/helper/shared_preferences_helper.dart';
import 'package:presensi_smkn1punggelan/core/widget/base_notifier.dart';

class HomeNotifier extends BaseNotifier {
  final ScheduleGetUseCase _scheduleGet;
  final AttendanceGetTodayUseCase _attendanceGetToday;
  final AttendanceGetMonthUseCase _attendanceGetThisMonth;

  HomeNotifier(
    this._scheduleGet,
    this._attendanceGetToday,
    this._attendanceGetThisMonth,
  );

  String _name = '';
  ScheduleEntity? _schedule;
  AttendanceEntity? _attendanceToday;
  List<AttendanceEntity> _attendanceThisMonth = [];

  String get name => _name;
  ScheduleEntity? get schedule => _schedule;
  AttendanceEntity? get attendanceToday => _attendanceToday;
  List<AttendanceEntity> get attendanceThisMonth => _attendanceThisMonth;
  bool get isLeaves => false;

  @override
  Future<void> init() async {
    setStateLoading();
    try {
      await _loadUserData();
      await _loadSchedule();
      await _loadTodayAttendance();
      await _loadMonthAttendance();
      setStateSuccess();
    } catch (e) {
      setStateError(e.toString());
    }
    notifyListeners();
  }

  Future<void> _loadUserData() async {
    _name = await SharedPreferencesHelper.getString(PREF_NAME) ?? 'User';
  }

  Future<void> _loadSchedule() async {
    final result = await _scheduleGet.call();
    if (result.success && result.data != null) {
      _schedule = result.data;
    } else {
      throw Exception(result.message);
    }
  }

  Future<void> _loadTodayAttendance() async {
    final result = await _attendanceGetToday.call();
    if (result.success) {
      _attendanceToday = result.data;
    }
  }

  Future<void> _loadMonthAttendance() async {
    final result = await _attendanceGetThisMonth.call();
    if (result.success && result.data != null) {
      _attendanceThisMonth = result.data!;
    } else {
      _attendanceThisMonth = [];
    }
  }
}
