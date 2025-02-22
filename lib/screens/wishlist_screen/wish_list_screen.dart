import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/custom_appbar.dart';
import 'package:ui_challange/screens/wishlist_screen/widgets/wishlist_item_design.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Wishlist",
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return WishListItemDesign(
              imageUrl: "https://m.media-amazon.com/images/I/81e5hN0JwaL.jpg",
              title: "Harry Potter and the Deathly",
              rating: 4.9,
              price: 9.99,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemCount: 7,
        ),
      ),
    );
  }
}
