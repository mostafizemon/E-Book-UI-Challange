import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final double price;

  const BookCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star_half, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                rating.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(width: 8),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
