import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/feature_title.dart';
import 'package:ui_challange/screens/book_details_screen/widgets/book_stats.dart';
import 'package:ui_challange/screens/book_details_screen/widgets/ratings_reviews.dart';

import '../../app/app_colors.dart';
import '../../common/widgets/book_card.dart';
import '../../data/books_data.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.contact_page)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://c8.alamy.com/comp/2C7GK8C/harry-potter-and-the-prisoner-of-azkaban-movie-poster-2C7GK8C.jpg",
                        // width: 130,
                        height: 220,
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
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "J.K. Rowling",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Released on Dec. 2015",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 8),

                          // Categories
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _buildCategoryChip("Fantasy"),
                              _buildCategoryChip("Fiction"),
                              _buildCategoryChip("Mystery"),
                              _buildCategoryChip("Magic"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              BookStats(),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text("Buy USD \$9.99")),
              SizedBox(height: 16),

              FeatureTitle(onPressed: () {}, title: "About this Ebook"),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                maxLines: 4,
                style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16),
              ),
              SizedBox(height: 16),
              FeatureTitle(onPressed: () {}, title: "Ratings & Reviews"),
              SizedBox(height: 8),
              RatingsReviews(),
              SizedBox(height: 8),
              Divider(color: Colors.black12),
              SizedBox(height: 16),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rate this Ebook",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Icon(Icons.star_outline_outlined, size: 40),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 175,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: AppColors.themeColor,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Write a Review",
                            style: TextStyle(
                              fontSize: 18, // Adjust font size if needed
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign:
                                TextAlign.center, // Ensure text alignment
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),
                    FeatureTitle(
                      onPressed: () {},
                      title: "Harry Potter Series",
                    ),
                    SizedBox(height: 8),

                    SizedBox(
                      height: 370,
                      child: ListView.separated(
                        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final book = books[index];
                          return BookCard(
                            imageUrl: book["imageUrl"],
                            title: book["title"],
                            rating: book["rating"],
                            price: book["price"],
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsScreen()));
                            },
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: 12),
                        itemCount: books.length,
                      ),
                    ),
                    SizedBox(height: 16),
                    FeatureTitle(onPressed: () {}, title: "Similar Ebooks"),
                    SizedBox(height: 8),

                    SizedBox(
                      height: 370,
                      child: ListView.separated(
                        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final book = books[index];
                          return BookCard(
                            imageUrl: book["imageUrl"],
                            title: book["title"],
                            rating: book["rating"],
                            price: book["price"],
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsScreen()));
                            },
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: 12),
                        itemCount: books.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }
}
