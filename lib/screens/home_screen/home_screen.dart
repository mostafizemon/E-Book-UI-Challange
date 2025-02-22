import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/book_card.dart';
import '../../app/app_colors.dart';
import '../../common/widgets/feature_title.dart';
import '../../common/widgets/genre_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> books = [
      {
        "imageUrl": "https://m.media-amazon.com/images/I/81e5hN0JwaL.jpg",
        "title": "The House of Hades (Heroes of Olympus)",
        "rating": 4.6,
        "price": 7.50,
      },
      {
        "imageUrl": "https://m.media-amazon.com/images/I/81e5hN0JwaL.jpg",
        "title": "My Quiet Blacksmith Life in Another World",
        "rating": 4.7,
        "price": 6.99,
      },
      {
        "imageUrl": "https://m.media-amazon.com/images/I/81e5hN0JwaL.jpg",
        "title": "It Starts with Us: A Novel",
        "rating": 4.8,
        "price": 11.50,
      },
    ];

    final List<Map<String, String>> genres = const [
      {
        "title": "Romance",
        "imageUrl":
            "https://cdn.shopify.com/s/files/1/0268/8847/0580/files/Irresistible_Chemistry_1024x1024.jpg?v=1719531436",
      },
      {
        "title": "Thriller",
        "imageUrl":
            "https://cdn.shopify.com/s/files/1/0268/8847/0580/files/Irresistible_Chemistry_1024x1024.jpg?v=1719531436",
      },
      {
        "title": "Inspiration",
        "imageUrl":
            "https://cdn.shopify.com/s/files/1/0268/8847/0580/files/Irresistible_Chemistry_1024x1024.jpg?v=1719531436",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/logo.png",
            color: AppColors.themeColor,
          ),
        ),
        title: Text(
          "Erabook",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 360,
                child: ListView.separated(
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
              FeatureTitle(onPressed: () {}, title: "Explore by Genre"),
              SizedBox(height: 8),

              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return GenreCard(
                      title: genres[index]["title"]!,
                      imageUrl: genres[index]["imageUrl"]!,
                    );
                  },
                ),
              ),

              SizedBox(height: 16),
              FeatureTitle(onPressed: () {}, title: "Recommended For You"),
              SizedBox(height: 8),

              SizedBox(
                height: 360,
                child: ListView.separated(
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
              FeatureTitle(onPressed: () {}, title: "On Your Purchased"),
              SizedBox(height: 8),

              SizedBox(
                height: 360,
                child: ListView.separated(
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
              FeatureTitle(onPressed: () {}, title: "On Your Wishlist"),
              SizedBox(height: 8),

              SizedBox(
                height: 360,
                child: ListView.separated(
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
