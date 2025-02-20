import 'package:flutter/material.dart';

class AuthTitleSubtitle extends StatelessWidget {
  final String title;
  final String description;
  const AuthTitleSubtitle({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.bold),),
        SizedBox(height: 16,),
        Text(description,style: TextStyle(fontSize: 16,color: Colors.black87),),
      ],
    );
  }
}
