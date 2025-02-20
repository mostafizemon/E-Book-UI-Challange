import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/common/widgets/input_title.dart';
import 'package:ui_challange/screens/otp_verification_screen/otp_verification_screen.dart';

import '../../app/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailTEController = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTitleSubtitle(
                title: "Forgot Password 🔑",
                description:
                    "Enter your email address. We will sent and OTP code for verification in the next step",
              ),
              SizedBox(height: 32),
              InputTitle(title: "Email"),
              TextFormField(
                controller: _emailTEController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: AppColors.themeColor,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter Your email-address";
                  }
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(_emailTEController.value.text.trim());
                  if (!emailValid) {
                    return "Enter Your valid email-address";
                  }
                  return null;
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpVerificationScreen(),
                      ),
                    );
                  }
                },
                child: Text("Continue"),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
