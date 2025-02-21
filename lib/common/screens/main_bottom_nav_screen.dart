import 'package:flutter/material.dart';
import 'package:ui_challange/screens/account_screen/account_screen.dart';
import 'package:ui_challange/screens/discover_screen/discover_screen.dart';
import 'package:ui_challange/screens/home_screen/home_screen.dart';
import 'package:ui_challange/screens/purchased_screen/purchased_screen.dart';
import 'package:ui_challange/screens/wishlist_screen/wish_list_screen.dart';
import '../../app/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    WishListScreen(),
    PurchasedScreen(),
    AccountScreen(),
  ];

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: myIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.themeColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Discover"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Purchased",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
