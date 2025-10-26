import 'package:flutter/material.dart';

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
