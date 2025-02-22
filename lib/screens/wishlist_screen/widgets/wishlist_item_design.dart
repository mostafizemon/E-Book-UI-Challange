import 'package:flutter/material.dart';

class WishListItemDesign extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final double price;

  const WishListItemDesign({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 150,
              width: 110,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star_half_sharp, color: Colors.grey, size: 20),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "\$$price",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {
              if (value == "remove") {
                print("Remove from Wishlist");
              } else if (value == "share") {
                print("Share");
              } else if (value == "about") {
                print("About Ebook");
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(
                    value: "remove",
                    child: ListTile(
                      leading: Icon(Icons.delete_outline, color: Colors.black),
                      title: Text("Remove from Wishlist"),
                    ),
                  ),
                  PopupMenuItem(
                    value: "share",
                    child: ListTile(
                      leading: Icon(Icons.share_outlined, color: Colors.black),
                      title: Text("Share"),
                    ),
                  ),
                  PopupMenuItem(
                    value: "about",
                    child: ListTile(
                      leading: Icon(Icons.info_outline, color: Colors.black),
                      title: Text("About Ebook"),
                    ),
                  ),
                ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
