import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/signuploginscreen.dart';

class LeadBookScreen extends StatefulWidget {
  const LeadBookScreen({super.key});

  @override
  _LeadBookScreenState createState() => _LeadBookScreenState();
}

class _LeadBookScreenState extends State<LeadBookScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpLoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Image.asset(
          'assets/images/msimg.png',
          fit: BoxFit.cover, // or BoxFit.fill depending on your design
        ),
      ),
    );
  }
}
