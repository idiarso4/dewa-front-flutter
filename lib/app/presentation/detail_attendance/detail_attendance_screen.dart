import 'package:flutter/material.dart';
import 'package:presensi_smkn1punggelan/app/domain/entity/attendance.dart';
import 'package:presensi_smkn1punggelan/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:presensi_smkn1punggelan/core/helper/date_time_helper.dart';
import 'package:presensi_smkn1punggelan/core/helper/global_helper.dart';
import 'package:presensi_smkn1punggelan/core/widget/app_widget.dart';

class DetailAttendanceScreen extends StatelessWidget {
  const DetailAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
        backgroundColor: Color(0xFF1A237E),
      ),
      body: Center(
        child: Text('Detail Attendance Screen'),
      ),
    );
  }
}
