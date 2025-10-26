// ignore_for_file: must_be_immutable

import 'package:presensi_smkn1punggelan/app/presentation/home/home_screen.dart';
import 'package:presensi_smkn1punggelan/app/presentation/login/login_notifier.dart';
import 'package:presensi_smkn1punggelan/core/helper/global_helper.dart';
import 'package:presensi_smkn1punggelan/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends AppWidget<LoginNotifier, void, void> {
  const LoginScreen({super.key});
  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isLoged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF42A5F5), // Biru terang
                Color(0xFF66BB6A), // Hijau terang
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Menambahkan logo dengan efek fade-in
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 2),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'E-Presensi',
                        style: GlobalHelper.getTextStyle(context,
                                appTextStyle: AppTextStyle.displayMedium)
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'SMKN 1 Punggelan',
                        style: GlobalHelper.getTextStyle(context,
                                appTextStyle: AppTextStyle.displayMedium)
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                _buildEmailField(),
                SizedBox(height: 20),
                _buildPasswordField(),
                SizedBox(height: 30),
                _buildLoginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: notifier.emailController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.email, color: Colors.blue),
        label: Text('Email', style: TextStyle(color: Colors.blue)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: notifier.passwordController,
      obscureText: !notifier.isShowPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.lock, color: Colors.blue),
        label: Text('Password', style: TextStyle(color: Colors.blue)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            notifier.isShowPassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.blue,
          ),
          onPressed: _showHidePassword,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () => _onPressLogin(context),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white70)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Or continue with",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Expanded(child: Divider(color: Colors.white70)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialButton(
              onPressed: () => _onPressGoogleLogin(context),
              icon: 'assets/images/google_icon.png',
              label: 'Google',
            ),
            _buildSocialButton(
              onPressed: () => _onPressFacebookLogin(context),
              icon: 'assets/images/facebook_icon.png',
              label: 'Facebook',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required String icon,
    required String label,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        side: BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      icon: Image.asset(
        icon,
        width: 24,
        height: 24,
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _showHidePassword() {
    notifier.isShowPassword = !notifier.isShowPassword;
  }

  _onPressLogin(BuildContext context) {
    notifier.login();
  }

  void _onPressGoogleLogin(BuildContext context) {
    // Placeholder for future Google login integration
    notifier.googleLogin();
  }

  void _onPressFacebookLogin(BuildContext context) {
    // Placeholder for future Facebook login integration
    notifier.facebookLogin();
  }
}
