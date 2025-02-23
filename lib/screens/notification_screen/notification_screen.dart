import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Map<String, bool> notifications = {
    "There is a New Recommendation": true,
    "There's a New Book Series": false,
    "There is an update from Authors": false,
    "There are Price Drops Available": true,
    "When I Make a Purchase": true,
    "Enable App System Notifications": true,
    "New Tips & Services Available": false,
    "Participate in Survey": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Notification",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notify me when...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children:
                    notifications.keys.map((String key) {
                      return SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          key,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        activeColor: Colors.white,
                        activeTrackColor: AppColors.themeColor,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade300,
                        value: notifications[key]!,
                        onChanged: (bool value) {
                          setState(() {
                            notifications[key] = value;
                          });
                        },
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
