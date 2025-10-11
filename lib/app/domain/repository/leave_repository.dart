import 'package:presensi_smkn1punggelan/app/domain/entity/leave.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';

abstract class LeaveRepository {
  Future<DataState> sendLeave(LeaveParamEntity param);
}
