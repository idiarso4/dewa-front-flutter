class ScheduleEntity {
  final int id;
  final String startTime;
  final String endTime;
  final bool isWfa;
  final OfficeEntity office;

  ScheduleEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.isWfa,
    required this.office,
  });
}

class OfficeEntity {
  final int id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final int radius;

  OfficeEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });
}
