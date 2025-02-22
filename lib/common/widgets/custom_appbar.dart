import 'package:flutter/material.dart';
import '../../app/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? serachOnTap;
  final VoidCallback? notificationOnTap;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppbar({
    super.key,
    required this.title,
    this.serachOnTap,
    this.notificationOnTap,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      actions: actions ??
          [
            IconButton(onPressed: serachOnTap ??(){}, icon: Icon(Icons.search)),
            IconButton(onPressed: notificationOnTap ?? () {}, icon: Icon(Icons.notifications)),
          ],
      leading: leading ??
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/logo.png",
              color: AppColors.themeColor,
            ),
          ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
