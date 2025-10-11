class LeaveEntity {
  final int id;
  final int userId;
  final String startDate;
  final String endDate;
  final String reason;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LeaveEntity({
    required this.id,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
}

class LeaveParamEntity {
  final String startDate;
  final String endDate;
  final String reason;

  LeaveParamEntity({
    required this.startDate,
    required this.endDate,
    required this.reason,
  });

  Map<String, dynamic> toJson() {
    return {
      'start_date': startDate,
      'end_date': endDate,
      'reason': reason,
    };
  }
}
