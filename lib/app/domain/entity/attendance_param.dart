class AttendanceParamEntity {
  final String? latitude;
  final String? longitude;
  final String? address;
  final String? photo;
  final String type; // 'checkin' or 'checkout'

  AttendanceParamEntity({
    this.latitude,
    this.longitude,
    this.address,
    this.photo,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (photo != null) 'photo': photo,
      'type': type,
    };
  }
}

class AttendanceParamGetEntity {
  final int month;
  final int year;

  AttendanceParamGetEntity({
    required this.month,
    required this.year,
  });
}
