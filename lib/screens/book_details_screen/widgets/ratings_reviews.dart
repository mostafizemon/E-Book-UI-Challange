import 'package:flutter/material.dart';

class RatingsReviews extends StatelessWidget {
  const RatingsReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rating Score & Star Icons
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "4.9",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        Icon(Icons.star, color: Colors.orange, size: 20),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "(6.8k reviews)",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(width: 16),

            // Star Progress Bars
            Expanded(
              child: Column(
                children: [
                  _buildRatingBar(5, 0.9),
                  _buildRatingBar(4, 0.7),
                  _buildRatingBar(3, 0.2),
                  _buildRatingBar(2, 0.1),
                  _buildRatingBar(1, 0.05),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBar(int star, double percentage) {
    return Row(
      children: [
        Text(
          "$star",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey.shade300,
            color: Colors.orange,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
