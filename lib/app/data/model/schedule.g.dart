// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      id: _intFromJson(json['id']),
      startTime: _stringFromJson(json['start_time']),
      endTime: _stringFromJson(json['end_time']),
      isWfa: _boolFromJson(json['is_wfa']),
      office: OfficeModel.fromJson(json['office'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': _stringToJson(instance.startTime),
      'end_time': _stringToJson(instance.endTime),
      'is_wfa': instance.isWfa,
      'office': instance.office,
    };

OfficeModel _$OfficeModelFromJson(Map<String, dynamic> json) => OfficeModel(
      id: _intFromJson(json['id']),
      name: json['name'] as String,
      address: json['address'] as String? ?? '',
      latitude: _doubleFromJson(json['latitude']),
      longitude: _doubleFromJson(json['longitude']),
      radius: _intFromJson(json['radius']),
    );

Map<String, dynamic> _$OfficeModelToJson(OfficeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
    };
