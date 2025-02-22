import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const GenreCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(12),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          shadows: [
            Shadow(blurRadius: 4, color: Colors.black.withOpacity(0.8)),
          ],
        ),
      ),
    );
  }
}
