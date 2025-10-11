import 'package:presensi_smkn1punggelan/core/constant/constant.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'leave_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class LeaveApiService {
  factory LeaveApiService(Dio dio) {
    return _LeaveApiService(dio);
  }

  @POST('/api/leaves')
  Future<HttpResponse<DataState>> send(
      {@Body() required Map<String, dynamic> body});
}
