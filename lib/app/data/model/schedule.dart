import 'package:json_annotation/json_annotation.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/schedule.dart';

part 'schedule.g.dart';

@JsonSerializable()
class ScheduleModel {
  final int id;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  @JsonKey(name: 'is_wfa')
  final bool isWfa;
  final OfficeModel office;

  ScheduleModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.isWfa,
    required this.office,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);

  ScheduleEntity toEntity() {
    return ScheduleEntity(
      id: id,
      startTime: startTime,
      endTime: endTime,
      isWfa: isWfa,
      office: office.toEntity(),
    );
  }
}

@JsonSerializable()
class OfficeModel {
  final int id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final int radius;

  OfficeModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });

  factory OfficeModel.fromJson(Map<String, dynamic> json) =>
      _$OfficeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeModelToJson(this);

  OfficeEntity toEntity() {
    return OfficeEntity(
      id: id,
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
  }
}
