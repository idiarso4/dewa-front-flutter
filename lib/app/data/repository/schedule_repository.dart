import 'package:presensi_smkn1punggelan/app/data/model/schedule_response.dart';
import 'package:presensi_smkn1punggelan/app/data/source/schedule_api_service.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/schedule.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/schedule_repository.dart';
import 'package:presensi_smkn1punggelan/core/constant/constant.dart';
import 'package:presensi_smkn1punggelan/core/helper/shared_preferences_helper.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleApiService _scheduleApiService;

  ScheduleRepositoryImpl(this._scheduleApiService);

  @override
  Future<DataState<ScheduleEntity>> getSchedule() {
    return handleResponse(
      () => _scheduleApiService.get(),
      (json) {
        final response = ScheduleResponse.fromJson(json);
        final data = response.schedule.toEntity();
        SharedPreferencesHelper.setString(PREF_START_SHIFT, data.startTime);
        SharedPreferencesHelper.setString(PREF_END_SHIFT, data.endTime);
        return data;
      },
    );
  }

  @override
  Future<DataState> checkBanned() {
    return handleResponse(
      () => _scheduleApiService.banned(),
      (json) => null,
    );
  }
}
