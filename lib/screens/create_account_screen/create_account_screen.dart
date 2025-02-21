import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/common/widgets/custom_confirm_password_field.dart';
import 'package:ui_challange/common/widgets/custom_linear_progress_indicator.dart';
import 'package:ui_challange/common/widgets/input_title.dart';

import '../../app/app_colors.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _usernameTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomLinearProgressIndicator(currentstep: 5),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthTitleSubtitle(
                      title: "Create an Account",
                      description:
                          "Enter your username,email & password. If you forget it, then you have to do forgot password.",
                    ),
                    SizedBox(height: 32),
                    InputTitle(title: "Username"),
                    TextFormField(
                      cursorColor: AppColors.themeColor,
                      controller: _usernameTEController,
                    ),
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),

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
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Sign UP")),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
