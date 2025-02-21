import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart'; // Import Country Picker
import 'package:ui_challange/common/widgets/auth_title_subtitle.dart';
import 'package:ui_challange/common/widgets/input_title.dart';
import 'package:ui_challange/screens/complete_profile_screen/widgets/profile_image_picker.dart';
import 'package:ui_challange/screens/create_account_screen/create_account_screen.dart';
import '../../app/app_colors.dart';
import '../../common/widgets/custom_linear_progress_indicator.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
      });
    }
  }

  void _selectCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _countryController.text = country.name;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomLinearProgressIndicator(currentstep: 4),
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
                      title: "Complete Your Profile",
                      description:
                          "Don't worry, only you can see your personal data. No one else will be able to see it.",
                    ),
                    SizedBox(height: 32),
                    ProfileImagePicker(
                      imageFile: _imageFile,
                      onPickImage: _pickImage,
                    ),
                    SizedBox(height: 32),
                    InputTitle(title: "Full Name"),
                    TextFormField(
                      cursorColor: AppColors.themeColor,
                      controller: _fullnameController,
                    ),
                    SizedBox(height: 16),
                    InputTitle(title: "Phone Number"),
                    TextFormField(
                      controller: _phoneController,
                      cursorColor: AppColors.themeColor,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),
                    InputTitle(title: "Date of Birth"),
                    TextFormField(
                      controller: _dobController,
                      cursorColor: AppColors.themeColor,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    InputTitle(title: "Country"),
                    TextFormField(
                      controller: _countryController,
                      readOnly: true,
                      onTap: _selectCountry,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountScreen()));
            }, child: Text("Continue")),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
