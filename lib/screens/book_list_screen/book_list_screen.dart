import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/book_card.dart';
import 'package:ui_challange/common/widgets/genre_card.dart';

import '../../data/books_data.dart';
import '../../data/genere_data.dart';

class BookListScreen extends StatelessWidget {
  final String title;
  final bool? isgenre;

  const BookListScreen({super.key, required this.title, this.isgenre});

  @override
  Widget build(BuildContext context) {
    bool showGenres = isgenre ?? false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: showGenres ? genres.length : books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: showGenres ? 2 : 0.5,
          ),
          itemBuilder: (context, index) {
            if (showGenres) {
              return GenreCard(
                title: genres[index]["title"]!,
                imageUrl: genres[index]["imageUrl"]!,
              );
            } else {
              return BookCard(
                title: books[index]["title"]!,
                imageUrl: books[index]["imageUrl"]!,
                price: books[index]["price"]!,
                rating: books[index]["rating"]!, onTap: () {  },
              );
            }
          },
        ),
      ),
    );
  }
}
