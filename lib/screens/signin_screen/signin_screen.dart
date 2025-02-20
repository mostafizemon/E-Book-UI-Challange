import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/common/widgets/input_title.dart';
import 'package:ui_challange/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:ui_challange/screens/signin_screen/widgets/social_button.dart';

import '../../app/app_colors.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthTitleSubtitle(
                        title: "Hello There 👋",
                        description:
                            "Please enter your username/email and password to sign in.",
                      ),

                      SizedBox(height: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputTitle(title: "Username / Email"),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: _emailTEController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          InputTitle(title: "Password"),
                          SizedBox(height: 4),
                          // TextFormField(
                          //   cursorColor: AppColors.themeColor,
                          //   obscureText: !_isPasswordVisible,
                          //   decoration: InputDecoration(
                          //     suffixIcon: IconButton(
                          //       onPressed: () {
                          //         setState(() {
                          //           _isPasswordVisible = !_isPasswordVisible;
                          //         });
                          //       },
                          //       icon: Icon(
                          //         color: AppColors.themeColor,
                          //         _isPasswordVisible
                          //             ? Icons.visibility
                          //             : Icons.visibility_off,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          TextFormField(
                            controller:
                                _passwordTEController, // Add the controller
                            cursorColor: AppColors.themeColor,
                            obscureText: !_isPasswordVisible,
                            autovalidateMode:
                                AutovalidateMode
                                    .onUserInteraction, // Validate while typing
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  color: AppColors.themeColor,
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Enter your password";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: AppColors.themeColor,
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          Text("Remember me", style: TextStyle(fontSize: 16)),
                        ],
                      ),

                      SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          "or continue with",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),

                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                            assetPath: "assets/images/google_icon.png",
                          ),
                          SizedBox(width: 16),
                          SocialButton(
                            assetPath: "assets/images/apple_icon.png",
                          ),
                          SizedBox(width: 16),
                          SocialButton(
                            assetPath: "assets/images/facebook_icon.png",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  print("Validation Passed! Proceeding with login...");
                  //TODO: Move to HomeScreen
                }
              },
              child: Text("Sign In"),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
