import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/common/widgets/custom_confirm_password_field.dart';
import 'package:ui_challange/common/widgets/input_title.dart';

import '../../app/app_colors.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthTitleSubtitle(
                        title: "Create New Password",
                        description:
                            "Enter your password. If you forget it, then you have to do forgot password",
                      ),
                      SizedBox(height: 32),
                      CustomConfirmPasswordField(
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        rememberMe: _rememberMe,
                        onRememberMeChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //TODO:
                  print("Password successfully validated!");
                }
              },
              child: Text("Continue"),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
