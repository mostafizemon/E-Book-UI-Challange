import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/screens/complete_profile_screen/complete_profile_screen.dart';
import '../../app/app_colors.dart';
import '../../common/widgets/custom_linear_progress_indicator.dart';
import '../../data/book_generes.dart';

class BookGenreSelectionScreen extends StatefulWidget {
  const BookGenreSelectionScreen({super.key});

  @override
  State<BookGenreSelectionScreen> createState() =>
      _BookGenreSelectionScreenState();
}

class _BookGenreSelectionScreenState extends State<BookGenreSelectionScreen> {
  final Set<String> _selectedGenres = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomLinearProgressIndicator(currentstep: 3),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AuthTitleSubtitle(
              title: "Choose the Book Genre You Like",
              description:
                  "Select your preferred book genre for better recommendations,or you can skip it.",
            ),
            SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children:
                      bookGenres.map((genre) {
                        final isSelected = _selectedGenres.contains(genre);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedGenres.remove(genre);
                              } else {
                                _selectedGenres.add(genre);
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.themeColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              color:
                                  isSelected
                                      ? AppColors.themeColor
                                      : Colors.transparent,
                            ),
                            child: Text(
                              genre,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    isSelected
                                        ? Colors.white
                                        : AppColors.themeColor,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFfef4e6),
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: AppColors.themeColor),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteProfileScreen()));
                    },
                    child: Text("Continue"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
