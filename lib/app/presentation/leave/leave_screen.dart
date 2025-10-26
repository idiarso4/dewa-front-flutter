// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:presensi_smkn1punggelan/app/presentation/leave/leave_notifier.dart';
import 'package:presensi_smkn1punggelan/core/helper/date_time_helper.dart';
import 'package:presensi_smkn1punggelan/core/widget/app_widget.dart';

class LeaveScreen extends AppWidget<LeaveNotifier, void, void> {
  const LeaveScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Cuti'),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            readOnly: true,
            controller: notifier.startDateController,
            onTap: () => _onPressDate(context, notifier.startDateController),
            decoration: InputDecoration(
                label: Text('Tanggal mulai'), border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            readOnly: true,
            onTap: () => _onPressDate(context, notifier.endDateController),
            controller: notifier.endDateController,
            decoration: InputDecoration(
                label: Text('Tanggal selesai'), border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: notifier.reasonController,
            decoration: InputDecoration(
                label: Text('Alasan'), border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
                onPressed: () => _onPressSend(), child: Text('Kirim')),
          )
        ],
      ),
    ));
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      Navigator.pop(context);
    }
  }

  _onPressDate(BuildContext context, TextEditingController controller) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (dateTime != null) {
      final dateTimeString = DateTimeHelper.formatDateTime(
          dateTime: dateTime, format: 'yyyy-MM-dd');
      controller.text = dateTimeString;
    }
  }

  _onPressSend() {
    notifier.send();
  }
}
