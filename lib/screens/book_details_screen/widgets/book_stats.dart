import 'package:flutter/material.dart';

class BookStats extends StatelessWidget {
  const BookStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem("4.9", "⭐", "6.8K reviews"),
          _buildDivider(),
          _buildStatItem("5.6 MB", null, "size"),
          _buildDivider(),
          _buildStatItem("784", null, "pages"),
          _buildDivider(),
          _buildStatItem("50M+", null, "purchases"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String? icon, String label) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: 4),
                Text(icon, style: TextStyle(fontSize: 18)),
              ],
            ],
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey.shade300,
      margin: EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
