import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.file_download_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://m.media-amazon.com/images/I/91ocU8970hL.jpg", // Replace with your image URL
                    height: 150,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Harry Potter & the Deathly Hallows",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "J.K. Rowling",
                        style: TextStyle(color: Colors.orange),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Released on Dec. 2015",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        children: [
                          _buildTag("Fantasy"),
                          _buildTag("Fiction"),
                          _buildTag("Magic"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoItem(Icons.star, "4.9", "6.8K reviews"),
                _buildInfoItem(Icons.storage, "5.6 MB", "Size"),
                _buildInfoItem(Icons.menu_book, "784", "Pages"),
                _buildInfoItem(Icons.people, "50M+", "Purchases"),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: Text("Buy USD \$9.99"),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("About this Ebook"),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...",
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Ratings & Reviews"),
            _buildRating(4.9, 6800),
            SizedBox(height: 8),
            _buildRatingBar(),
            SizedBox(height: 16),
            _buildSectionTitle("Rate this Ebook"),
            _buildStarRating(),
            SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.orange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: Text(
                "Write a Review",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.black54),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        SizedBox(height: 4),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.arrow_forward, size: 20),
      ],
    );
  }

  Widget _buildRating(double rating, int reviews) {
    return Row(
      children: [
        Text(
          rating.toString(),
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                5,
                    (index) => Icon(Icons.star, color: Colors.orange, size: 20),
              ),
            ),
            SizedBox(height: 4),
            Text("($reviews reviews)", style: TextStyle(color: Colors.black54)),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBar() {
    return Column(
      children: [
        _buildSingleRatingBar(5, 0.6),
        _buildSingleRatingBar(4, 0.2),
        _buildSingleRatingBar(3, 0.1),
        _buildSingleRatingBar(2, 0.1),
        _buildSingleRatingBar(1, 0.1),
      ],
    );
  }

  Widget _buildSingleRatingBar(int stars, double percent) {
    return Row(
      children: [
        Text(stars.toString()),
        SizedBox(width: 4),
        Expanded(
          child: LinearProgressIndicator(
            value: percent,
            backgroundColor: Colors.grey.shade300,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) => Icon(Icons.star_border, size: 32, color: Colors.orange),
      ),
    );
  }
}
