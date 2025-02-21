import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onPickImage;

  const ProfileImagePicker({super.key, required this.imageFile, required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: imageFile != null
                ? FileImage(imageFile!)
                : const AssetImage('assets/images/profile_pic.png') as ImageProvider,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onPickImage,
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.orange,
                child: Icon(Icons.edit, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
