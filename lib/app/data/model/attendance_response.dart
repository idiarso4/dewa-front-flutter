import 'package:json_annotation/json_annotation.dart';
import 'package:presensi_smkn1punggelan/app/data/model/attendance.dart';

part 'attendance_response.g.dart';

@JsonSerializable()
class AttendanceResponse {
  final AttendanceModel? today;
  @JsonKey(name: 'this_month')
  final List<AttendanceModel> thisMonth;

  AttendanceResponse({
    this.today,
    required this.thisMonth,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResponseToJson(this);
}
