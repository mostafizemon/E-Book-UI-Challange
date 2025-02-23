import 'package:flutter/material.dart';
import 'package:ui_challange/common/widgets/custom_appbar.dart';
import 'package:ui_challange/screens/personal_info_screen/personal_info_screen.dart';
import '../../app/app_colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkmode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Account",
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/images/profile_pic.png",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Andrew Ainsley",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "andrew_ainsley@yourdomain.com",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),
            ),

            Divider(color: Colors.black12),

            _buildAccountOption(Icons.payment, "Payment Methods", () {}),
            Divider(color: Colors.black12),
            _buildAccountOption(Icons.person, "Personal Info", () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfoScreen()));
            }),
            _buildAccountOption(Icons.notifications, "Notification", () {}),
            _buildAccountOption(Icons.settings, "Preferences", () {}),
            _buildAccountOption(Icons.lock, "Security", () {}),
            _buildAccountOption(
              Icons.language,
              "Language",
              () {},
              trailing: Text("English (US)", style: TextStyle(fontSize: 16)),
            ),
            _buildAccountOption(
              Icons.dark_mode,
              "Dark Mode",
              () {},
              trailing: _customSwitch(),
            ),

            Divider(color: Colors.black12),
            _buildAccountOption(Icons.help, "Help Center", () {}),
            _buildAccountOption(Icons.info, "About Erabook", () {}),

            _buildAccountOption(
              Icons.logout,
              "Logout",
              () {},
              color: Colors.red,
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _customSwitch() {
    return Switch(
      value: isDarkmode,
      onChanged: (value) {
        setState(() {
          isDarkmode = value;
        });
      },
      activeColor: AppColors.themeColor,
      activeTrackColor: Colors.grey.shade300,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey.shade300,
    );
  }

  Widget _buildAccountOption(
    IconData icon,
    String title,
    VoidCallback? onPressed, {
    Widget? trailing,
    Color? color,
  }) {
    return Column(
      children: [
        SizedBox(height: 8,),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: AppColors.themeColor),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: color ?? Colors.black,
            ),
          ),
          trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onPressed,
        ),
      ],
    );
  }
}
