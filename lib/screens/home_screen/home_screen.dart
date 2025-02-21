import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text("Erabook", style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 350,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 350,
                width: 170,
                child: Column(
                  children: [
                    Image.network(
                      "https://m.media-amazon.com/images/I/81e5hN0JwaL.jpg",
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "The House of Hades (Heroes of Olympus fdsfdsfdsf)",
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),

                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_half, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              "4.6",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Text(
                          "\$7.50",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
