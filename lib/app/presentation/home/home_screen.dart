// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:presensi_smkn1punggelan/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:presensi_smkn1punggelan/app/presentation/home/home_notifier.dart';
import 'package:presensi_smkn1punggelan/app/presentation/leave/leave_screen.dart';
import 'package:presensi_smkn1punggelan/app/presentation/login/login_screen.dart';
import 'package:presensi_smkn1punggelan/app/presentation/map/map_screen.dart';
import 'package:presensi_smkn1punggelan/core/helper/date_time_helper.dart';
import 'package:presensi_smkn1punggelan/core/helper/shared_preferences_helper.dart';
import 'package:presensi_smkn1punggelan/core/widget/app_widget.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  const HomeScreen({super.key});

  @override
  Widget bodyBuild(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => notifier.init(),
          color: Color(0xFF1A237E),
          backgroundColor: Colors.white,
          child: Container(
            color: Color(0xFF1A237E),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _headerLayout(context),
                  _workingHoursLayout(context),
                  _attendanceStatsLayout(context),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        selectedItemColor: Color(0xFF1A237E),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _handleNavigation(context, index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leave_bags_at_home),
            label: 'Cuti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Already on home
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAttendanceScreen(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LeaveScreen(),
          ),
        );
        break;
      case 3:
        _showProfileMenu(context);
        break;
    }
  }

  void _showProfileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF1A237E).withOpacity(0.1),
                child: Icon(Icons.person),
              ),
              title: Text(notifier.name),
              subtitle: Text(notifier.schedule?.office.name ?? 'No Office'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text('Pengaturan Notifikasi'),
              onTap: () {
                Navigator.pop(bottomSheetContext);
                _onPressEditNotification(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(bottomSheetContext);
                _onPressLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _workingHoursLayout(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jam Kerja Hari Ini',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateTimeHelper.formatDateTime(
                      dateTime: DateTime.now(),
                      format: 'EEEE, dd MMMM yyyy',
                    ),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF1A237E).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  (notifier.schedule?.isWfa ?? false) ? 'WFA' : 'WFO',
                  style: TextStyle(
                    color: Color(0xFF1A237E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTimeCard(
                context,
                'Masuk',
                notifier.attendanceToday?.startTime ?? '-',
                Icons.login,
                Colors.green,
              ),
              _buildTimeCard(
                context,
                'Pulang',
                notifier.attendanceToday?.endTime ?? '-',
                Icons.logout,
                Colors.red,
              ),
            ],
          ),
          SizedBox(height: 20),
          if (!notifier.isLeaves)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _onPressCreateAttendance(context),
                icon: Icon(Icons.camera_alt),
                label: Text('Buat Kehadiran'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A237E),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTimeCard(BuildContext context, String label, String time,
      IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _headerLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat Datang',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            notifier.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _attendanceStatsLayout(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('Statistik Kehadiran'),
    );
  }

  Future<void> _onPressCreateAttendance(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MapScreen()),
    );
    await notifier.init(); // refresh attendance data after returning from map screen
  }

  void _onPressEditNotification(BuildContext context) {}

  Future<void> _onPressLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Konfirmasi Logout'),
        content: Text('Apakah Anda yakin ingin keluar dari akun ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Logout'),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      await SharedPreferencesHelper.logout();
      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => LoginScreen()),
        (route) => false,
      );
    }
  }
}
