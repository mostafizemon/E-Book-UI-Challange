import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/screens/book_genre_selection_screen/book_genre_selection_screen.dart';

import '../../app/app_colors.dart';
import '../../common/widgets/custom_linear_progress_indicator.dart';
import '../../data/age_ranges.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  String? _selectedAge;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomLinearProgressIndicator(currentstep: 2),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTitleSubtitle(
              title: "Choose Your Age 🎯",
              description: "Select age range for better content",
            ),
            SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: ageRanges.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 24,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  final age = ageRanges[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAge = age;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.themeColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color:
                            _selectedAge == age
                                ? AppColors.themeColor
                                : Colors.transparent,
                      ),
                      child: Text(
                        age,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              _selectedAge == age
                                  ? Colors.white
                                  : AppColors.themeColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookGenreSelectionScreen()));
            }, child: Text("Continue")),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
