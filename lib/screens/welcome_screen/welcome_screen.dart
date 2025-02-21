import 'package:flutter/material.dart';
import 'package:ui_challange/screens/gender_selection_screen/gender_selection_screen.dart';
import 'package:ui_challange/screens/signin_screen/signin_screen.dart';
import 'package:ui_challange/screens/welcome_screen/widgets/blur_effect.dart';
import 'package:ui_challange/screens/welcome_screen/widgets/welcome_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/book_shelf.png",
              fit: BoxFit.cover,
            ),
          ),
          BlurEffect(),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WelcomeText(),
                  SizedBox(height: 16),

                  // Page Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        width: index == 1 ? 10 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: index == 1 ? Colors.orange : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      foregroundColor: Colors.black, // Text color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google_icon.png", width: 24),
                        SizedBox(width: 8),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenderSelectionScreen(),
                        ),
                      );
                    },
                    child: Text("Get Started"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFfef4e6),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    child: Text("I Already Have an Account"),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
