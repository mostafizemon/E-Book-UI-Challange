import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/feature_title.dart';

import '../../app/app_colors.dart';
import '../../common/widgets/book_card.dart';
import '../../data/books_data.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/logo.png",
            color: AppColors.themeColor,
          ),
        ),
        title: Text(
          "Discover",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FeatureTitle(onPressed: () {}, title: "Top Charts"),
              SizedBox(height: 8),
              SizedBox(
                height: 370,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(0,0,16,0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return BookCard(
                      imageUrl: book["imageUrl"],
                      title: book["title"],
                      rating: book["rating"],
                      price: book["price"],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: books.length,
                ),
              ),

              SizedBox(height: 16),
              FeatureTitle(onPressed: () {}, title: "Top Selling"),
              SizedBox(height: 8),

              SizedBox(
                height: 370,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(0,0,16,0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return BookCard(
                      imageUrl: book["imageUrl"],
                      title: book["title"],
                      rating: book["rating"],
                      price: book["price"],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: books.length,
                ),
              ),

              SizedBox(height: 16),
              FeatureTitle(onPressed: () {}, title: "Top Free"),
              SizedBox(height: 8),

              SizedBox(
                height: 370,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(0,0,16,0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return BookCard(
                      imageUrl: book["imageUrl"],
                      title: book["title"],
                      rating: book["rating"],
                      price: book["price"],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: books.length,
                ),
              ),
              SizedBox(height: 16),
              FeatureTitle(onPressed: () {}, title: "Top New Releases"),
              SizedBox(height: 8),

              SizedBox(
                height: 370,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(0,0,16,0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return BookCard(
                      imageUrl: book["imageUrl"],
                      title: book["title"],
                      rating: book["rating"],
                      price: book["price"],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: books.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
