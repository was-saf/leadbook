import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/asstudent.dart';
import 'package:leadbook/views/pages/astutor.dart';
import 'package:leadbook/views/pages/loginscreen.dart';

class StudentTutorScreen extends StatelessWidget {
  const StudentTutorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal: screenSize.width * 0.10,
      vertical: screenSize.height * 0.03,
    );
    final padding = screenSize.width * 0.05; // 5% of screen width for padding

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                // Center the title
                child: Text(
                  'LEAD BOOK',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.07, // 7% of screen width
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4654BF),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Text(
                'What would you like to Register as?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.width * 0.04,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              _buildRegistrationOption(
                context,
                title: 'As a Student:',
                buttonText: 'Register as a Student',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AsStudent()),
                  );
                },
                buttonPadding: buttonPadding,
              ),
              SizedBox(height: screenSize.height * 0.03),
              _buildRegistrationOption(
                context,
                title: 'As a Tutor:',
                buttonText: 'Register as a Tutor',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AsTutor()),
                  );
                },
                buttonPadding: buttonPadding,
              ),
              SizedBox(height: screenSize.height * 0.04),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Simply explore the App by pressing this text',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
                    color: Color(0xFF4654BF),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationOption(
    BuildContext context, {
    required String title,
    required String buttonText,
    required VoidCallback onPressed,
    required EdgeInsets buttonPadding,
  }) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: screenSize.width * 0.06,
              color: Color(0xFF4654BF),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenSize.height * 0.03),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4654BF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: buttonPadding,
              minimumSize: Size(screenSize.width * 0.7, 0),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: screenSize.width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
