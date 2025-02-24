import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/book_card.dart';
import 'package:ui_challange/screens/book_details_screen/book_details_screen.dart';
import 'package:ui_challange/screens/book_list_screen/book_list_screen.dart';
import '../../common/widgets/custom_appbar.dart';
import '../../common/widgets/feature_title.dart';
import '../../common/widgets/genre_card.dart';
import '../../data/books_data.dart';
import '../../data/genere_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Erabook",
        serachOnTap: () {},
        notificationOnTap: () {},
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsScreen()));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: books.length,
                ),
              ),
              SizedBox(height: 16),
              FeatureTitle(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => BookListScreen(
                            title: "Explore by Genre",
                            isgenre: true,
                          ),
                    ),
                  );
                },
                title: "Explore by Genre",
              ),
              SizedBox(height: 8),

              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
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
              FeatureTitle(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              BookListScreen(title: "Recommended For You"),
                    ),
                  );
                },
                title: "Recommended For You",
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
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: books.length,
                ),
              ),

              SizedBox(height: 16),
              FeatureTitle(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              BookListScreen(title: "On Your Purchased"),
                    ),
                  );
                },
                title: "On Your Purchased",
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
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: books.length,
                ),
              ),

              SizedBox(height: 16),
              FeatureTitle(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              BookListScreen(title: "On Your Wishlist"),
                    ),
                  );
                },
                title: "On Your Wishlist",
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
                      onTap: () {},
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
