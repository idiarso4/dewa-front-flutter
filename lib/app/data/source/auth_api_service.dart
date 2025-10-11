﻿import 'package:presensi_smkn1punggelan/core/constant/constant.dart';
import 'package:presensi_smkn1punggelan/core/network/data_state.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) {
    return _AuthApiService(dio);
  }

  @POST('/api/login')
  Future<HttpResponse<DataState>> login(
      {@Body() required Map<String, dynamic> body});
}
