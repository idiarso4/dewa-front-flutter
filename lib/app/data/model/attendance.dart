import 'package:json_annotation/json_annotation.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/attendance.dart';

part 'attendance.g.dart';

@JsonSerializable()
class AttendanceModel {
  final int? id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'start_latitude')
  final String? startLatitude;
  @JsonKey(name: 'start_longitude')
  final String? startLongitude;
  @JsonKey(name: 'end_latitude')
  final String? endLatitude;
  @JsonKey(name: 'end_longitude')
  final String? endLongitude;
  @JsonKey(name: 'start_address')
  final String? startAddress;
  @JsonKey(name: 'end_address')
  final String? endAddress;
  @JsonKey(name: 'start_photo')
  final String? startPhoto;
  @JsonKey(name: 'end_photo')
  final String? endPhoto;
  @JsonKey(name: 'working_hours')
  final int? workingHours;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  AttendanceModel({
    this.id,
    required this.userId,
    this.startTime,
    this.endTime,
    this.startLatitude,
    this.startLongitude,
    this.endLatitude,
    this.endLongitude,
    this.startAddress,
    this.endAddress,
    this.startPhoto,
    this.endPhoto,
    this.workingHours,
    this.createdAt,
    this.updatedAt,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);

  AttendanceEntity toEntity() {
    return AttendanceEntity(
      id: id,
      userId: userId,
      startTime: startTime,
      endTime: endTime,
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      endLatitude: endLatitude,
      endLongitude: endLongitude,
      startAddress: startAddress,
      endAddress: endAddress,
      startPhoto: startPhoto,
      endPhoto: endPhoto,
      workingHours: workingHours,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }
}
