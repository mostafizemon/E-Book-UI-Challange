import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/screens/create_new_password_screen/create_new_password_screen.dart';
import 'package:ui_challange/screens/otp_verification_screen/widgets/otp_fields.dart';
import '../../app/app_colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int _countdown = 55;
  late Timer _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _canResend = true;
          _timer.cancel();
        });
      }
    });
  }

  void _resendCode() {
    setState(() {
      _countdown = 55;
      _canResend = false;
    });
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTitleSubtitle(
              title: "You've Got Mail 📩",
              description:
                  "We have sent the OTP verification code to your email address. Check your email and enter the code below.",
            ),
            SizedBox(height: 32),

            OtpFields(),

            SizedBox(height: 32),

            Text(
              "Didn't receive an email?",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 16),

            // Resend Code Logic
            GestureDetector(
              onTap: _canResend ? _resendCode : null,
              child: Text(
                _canResend ? "Resend" : "You can resend code in $_countdown s",
                style: TextStyle(
                  fontSize: 14,
                  color: _canResend ? AppColors.themeColor : Colors.black87,
                  fontWeight: _canResend ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),

            SizedBox(height: 32),

            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewPasswordScreen()));
            }, child: Text("Confirm")),
          ],
        ),
      ),
    );
  }
}
