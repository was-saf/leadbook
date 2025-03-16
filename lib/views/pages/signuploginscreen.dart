import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/loginscreen.dart';
import 'package:leadbook/views/pages/SignUpScreen.dart';

class SignUpLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageHeight = screenSize.height * 0.15;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal:
          screenSize.width *
          0.25, // Increased from 0.15 to 0.25 for wider buttons
      vertical: screenSize.height * 0.02,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/white.PNG', height: imageHeight),
            SizedBox(height: screenSize.height * 0.03),
            Text(
              'LEAD BOOK',
              style: TextStyle(
                fontSize: screenSize.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Color(0xFF41B57F),
              ),
            ),
            SizedBox(height: screenSize.height * 0.05),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF41B57F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: buttonPadding,
                minimumSize: Size(
                  screenSize.width * 0.7,
                  0,
                ), // Set minimum width to 70% of screen width
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: screenSize.width * 0.045,
                  fontWeight: FontWeight.bold, // Made text bold
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF41B57F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: buttonPadding,
                minimumSize: Size(
                  screenSize.width * 0.7,
                  0,
                ), // Set minimum width to 70% of screen width
              ),
              child: Text(
                'Signup',
                style: TextStyle(
                  fontSize: screenSize.width * 0.045,
                  fontWeight: FontWeight.bold, // Made text bold
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.05),
            Text(
              'Learn. Grow. Succeed.',
              style: TextStyle(
                fontSize: screenSize.width * 0.04,
                color: Color(0xFF41B57F),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Image.asset('assets/images/chids.PNG', height: imageHeight),
          ],
        ),
      ),
    );
  }
}
