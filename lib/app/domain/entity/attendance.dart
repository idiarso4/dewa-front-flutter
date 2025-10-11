class AttendanceEntity {
  final int? id;
  final int userId;
  final String? startTime;
  final String? endTime;
  final String? startLatitude;
  final String? startLongitude;
  final String? endLatitude;
  final String? endLongitude;
  final String? startAddress;
  final String? endAddress;
  final String? startPhoto;
  final String? endPhoto;
  final int? workingHours;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AttendanceEntity({
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
}
