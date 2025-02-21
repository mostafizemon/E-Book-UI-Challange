import 'package:flutter/material.dart';
import '../../app/app_colors.dart';
import 'input_title.dart';

class CustomConfirmPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool rememberMe;
  final Function(bool?) onRememberMeChanged;

  const CustomConfirmPasswordField({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  @override
  State<CustomConfirmPasswordField> createState() =>
      _CustomConfirmPasswordFieldState();
}

class _CustomConfirmPasswordFieldState
    extends State<CustomConfirmPasswordField> {
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTitle(title: "Password"),
        TextFormField(
          controller: widget.passwordController,
          cursorColor: AppColors.themeColor,
          obscureText: !_isPasswordVisible1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible1 = !_isPasswordVisible1;
                });
              },
              icon: Icon(
                color: AppColors.themeColor,
                _isPasswordVisible1 ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter your password";
            } else if (value.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
        ),
        SizedBox(height: 16),
        InputTitle(title: "Confirm Password"),
        TextFormField(
          controller: widget.confirmPasswordController,
          cursorColor: AppColors.themeColor,
          obscureText: !_isPasswordVisible2,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible2 = !_isPasswordVisible2;
                });
              },
              icon: Icon(
                color: AppColors.themeColor,
                _isPasswordVisible2 ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Confirm your password";
            } else if (value != widget.passwordController.text) {
              return "Passwords do not match";
            }
            return null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColors.themeColor,
              value: widget.rememberMe,
              onChanged: widget.onRememberMeChanged,
            ),
            Text("Remember me", style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
