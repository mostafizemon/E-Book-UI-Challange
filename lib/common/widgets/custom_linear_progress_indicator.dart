import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({super.key,required this.currentstep});

  final int currentstep;

  @override
  Widget build(BuildContext context) {
    int totalsteps=5;
    double progress = currentstep / totalsteps;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8), // Set corner radius
          child: SizedBox(
            height: 12,
            width: MediaQuery.of(context).size.width * 0.5, // Increase height
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(AppColors.themeColor),
            ),
          ),
        ),
      ],
    );
  }
}
