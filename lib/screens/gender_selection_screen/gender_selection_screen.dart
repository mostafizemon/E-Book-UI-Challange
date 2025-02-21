import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/common/widgets/input_title.dart';
import 'package:ui_challange/screens/age_selection_screen/age_selection_screen.dart';
import '../../common/widgets/custom_linear_progress_indicator.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomLinearProgressIndicator(currentstep: 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTitleSubtitle(
              title: "What is your gender? 🧑‍🤝‍🧑",
              description: "Select gender for better content.",
            ),
            SizedBox(height: 24),
            RadioListTile<String>(
              title: InputTitle(title: "I am male"),
              value: "male",
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            Divider(color: Colors.black12),
            RadioListTile<String>(
              title: InputTitle(title: "I am female"),
              value: "female",
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            Divider(color: Colors.black12),
            RadioListTile<String>(
              title: InputTitle(title: "Rather not to say"),
              value: "prefer_not_say",
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),

            Spacer(),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AgeSelectionScreen()));
            }, child: Text("Continue")),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
