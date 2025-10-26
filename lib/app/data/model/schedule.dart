import 'package:json_annotation/json_annotation.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/schedule.dart';

part 'schedule.g.dart';

String _stringFromJson(dynamic value) => value?.toString() ?? '';
String _stringToJson(String value) => value;

bool _boolFromJson(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    return value == '1' || value.toLowerCase() == 'true';
  }
  return false;
}

double _doubleFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0;
}

int _intFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  return int.tryParse(value.toString()) ?? 0;
}

@JsonSerializable()
class ScheduleModel {
  final int id;
  @JsonKey(name: 'start_time', fromJson: _stringFromJson, toJson: _stringToJson)
  final String startTime;
  @JsonKey(name: 'end_time', fromJson: _stringFromJson, toJson: _stringToJson)
  final String endTime;
  @JsonKey(name: 'is_wfa', fromJson: _boolFromJson)
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
  @JsonKey(defaultValue: '')
  final String? address;
  @JsonKey(fromJson: _doubleFromJson)
  final double latitude;
  @JsonKey(fromJson: _doubleFromJson)
  final double longitude;
  @JsonKey(fromJson: _intFromJson)
  final int radius;

  OfficeModel({
    required this.id,
    required this.name,
    this.address,
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
      address: address ?? '',
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
  }
}
