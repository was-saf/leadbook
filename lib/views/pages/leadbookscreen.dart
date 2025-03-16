import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/signuploginscreen.dart';

class LeadBookScreen extends StatefulWidget {
  const LeadBookScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeadBookScreenState createState() => _LeadBookScreenState();
}

class _LeadBookScreenState extends State<LeadBookScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () {
      if (mounted) {
        // Ensure the widget is still in the tree
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpLoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final imageSize = screenSize.width * 0.25; // 25% of screen width

    return Scaffold(
      backgroundColor: Color(0xFF41B57F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/green.PNG',
              width: imageSize, // Responsive width
              height: imageSize, // Responsive height
            ),
            SizedBox(height: screenSize.height * 0.02), // 2% of screen height
            Text(
              'LEAD BOOK',
              style: TextStyle(
                fontSize: screenSize.width * 0.06, // 6% of screen width
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
