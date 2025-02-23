import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:ui_challange/common/widgets/input_title.dart';
import '../../app/app_colors.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  File? _image;
  final TextEditingController _dobController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailTEController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Personal Info",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        _image != null
                            ? FileImage(_image!)
                            : AssetImage('assets/images/profile_pic.png')
                                as ImageProvider,
                    child:
                        _image == null
                            ? Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 24,
                            )
                            : null,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Divider(color: Colors.black12),
              SizedBox(height: 16),
              InputTitle(title: "Full Name"),
              TextFormField(cursorColor: AppColors.themeColor),
              SizedBox(height: 24),
              InputTitle(title: "Username"),
              TextFormField(cursorColor: AppColors.themeColor),
              SizedBox(height: 24),
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
              SizedBox(height: 24),
              InputTitle(title: "Phone Number"),
              TextFormField(
                cursorColor: AppColors.themeColor,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 24),
              InputTitle(title: "Date of Birth"),
              TextFormField(
                controller: _dobController,
                cursorColor: AppColors.themeColor,
                readOnly: true,
                onTap: _selectDate,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today, color: Colors.orange),
                ),
              ),
              SizedBox(height: 24),
              InputTitle(title: "Street Address"),
              TextFormField(cursorColor: AppColors.themeColor),
            ],
          ),
        ),
      ),
    );
  }
}
