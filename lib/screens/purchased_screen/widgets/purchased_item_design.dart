import 'package:flutter/material.dart';

class PurchasedItemDesign extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final bool isDownloaded;

  const PurchasedItemDesign({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    this.isDownloaded = false,
  });

  @override
  _PurchasedItemDesignState createState() => _PurchasedItemDesignState();
}

class _PurchasedItemDesignState extends State<PurchasedItemDesign> {
  late bool _downloaded;

  @override
  void initState() {
    super.initState();
    _downloaded = widget.isDownloaded;
  }

  void _toggleDownload() {
    setState(() {
      _downloaded = !_downloaded;
    });

    if (_downloaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${widget.title} downloaded successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${widget.title} removed from downloads.")),
      );
    }
  }

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
              widget.imageUrl,
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
                  widget.title,
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
                      widget.rating.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Purchased",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              _downloaded ? Icons.check_box_rounded : Icons.download,
              color: _downloaded ? Colors.orange : Colors.black,
            ),
            onPressed: _toggleDownload,
          ),
          // More Options Menu
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {
              if (value == "remove") {
                print("Remove from Wishlist");
              } else if (value == "view") {
                print("View Series");
              } else if (value == "mark") {
                print("Mark as Finished");
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
                      title: Text("Remove from Download"),
                    ),
                  ),
                  PopupMenuItem(
                    value: "view",
                    child: ListTile(
                      leading: Icon(Icons.view_timeline, color: Colors.black),
                      title: Text("View Series"),
                    ),
                  ),
                  PopupMenuItem(
                    value: "mark",
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                      ),
                      title: Text("Mark as Finished"),
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
