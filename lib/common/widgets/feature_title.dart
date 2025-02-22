import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

class FeatureTitle extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const FeatureTitle({
    super.key, required this.onPressed, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_forward_outlined,
            color: AppColors.themeColor,
          ),
        ),
        SizedBox(width: 8,),
      ],
    );
  }
}