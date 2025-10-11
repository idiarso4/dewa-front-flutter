import 'package:presensi_smkn1punggelan/app/presentation/login/login_screen.dart';
import 'package:presensi_smkn1punggelan/core/helper/global_helper.dart';
import 'package:presensi_smkn1punggelan/core/helper/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function() onPressDefaultButton;
  final FilledButton? alternatifButton;
  const ErrorAppWidget(
      {super.key,
      required this.description,
      required this.onPressDefaultButton,
      this.alternatifButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: GlobalHelper.getTextStyle(context,
                appTextStyle: AppTextStyle.headlineSmall),
          ),
          SizedBox(
            height: 30,
          ),
          alternatifButton ??
              ((description.contains('401') ||
                      description.toLowerCase().contains('unauthenticated'))
                  ? FilledButton(
                      onPressed: () async {
                        await SharedPreferencesHelper.logout();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text('Logout'))
                  : FilledButton.icon(
                      onPressed: onPressDefaultButton,
                      icon: Icon(Icons.refresh),
                      label: Text("Refresh")))
        ],
      ),
    );
  }
}
