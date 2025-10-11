// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num).toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      startLatitude: json['start_latitude'] as String?,
      startLongitude: json['start_longitude'] as String?,
      endLatitude: json['end_latitude'] as String?,
      endLongitude: json['end_longitude'] as String?,
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      startPhoto: json['start_photo'] as String?,
      endPhoto: json['end_photo'] as String?,
      workingHours: (json['working_hours'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'start_address': instance.startAddress,
      'end_address': instance.endAddress,
      'start_photo': instance.startPhoto,
      'end_photo': instance.endPhoto,
      'working_hours': instance.workingHours,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
