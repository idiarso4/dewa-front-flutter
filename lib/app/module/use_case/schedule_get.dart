import 'package:presensi_smkn1punggelan/app/domain/entity/schedule.dart';
import 'package:presensi_smkn1punggelan/app/domain/repository/schedule_repository.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:presensi_smkn1punggelan/core/use_case/app_use_case.dart';

class ScheduleGetUseCase
    extends AppUseCase<Future<DataState<ScheduleEntity?>>, void> {
  final ScheduleRepository _scheduleRepository;

  ScheduleGetUseCase(this._scheduleRepository);

  @override
  Future<DataState<ScheduleEntity?>> call({void param}) {
    return _scheduleRepository.getSchedule();
  }
}
