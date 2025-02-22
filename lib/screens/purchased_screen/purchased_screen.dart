import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/custom_appbar.dart';
import 'package:ui_challange/screens/purchased_screen/widgets/purchased_item_design.dart';

class PurchasedScreen extends StatelessWidget {
  const PurchasedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Purchased",
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return PurchasedItemDesign(
              imageUrl: "https://m.media-amazon.com/images/I/81e5hN0JwaL.jpg",
              title: "Harry Potter and the Deathly Hallows",
              rating: 4.9,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemCount: 10,
        ),
      ),
    );
  }
}
