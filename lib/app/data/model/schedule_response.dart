import 'package:json_annotation/json_annotation.dart';
import 'package:presensi_smkn1punggelan/app/data/model/schedule.dart';

part 'schedule_response.g.dart';

@JsonSerializable()
class ScheduleResponse {
  final ScheduleModel schedule;

  ScheduleResponse({
    required this.schedule,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}
