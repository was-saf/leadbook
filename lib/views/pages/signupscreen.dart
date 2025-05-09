import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/loginscreen.dart';
import 'package:leadbook/views/pages/studenttutorscreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
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
        child: SingleChildScrollView(
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
              SizedBox(height: screenSize.height * 0.01), // 1% of screen height
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: screenSize.width * 0.06, // 6% of screen width
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.005,
              ), // 0.5% of screen height
              Row(
                children: [
                  Text(
                    'Have an account?',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      color: Colors.black,
                    ), // 4% of screen width
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ), // Replace with your login page
                      );
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04, // 4% of screen width
                        color: Color(0xFF4654BF),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02), // 2% of screen height
              _buildTextField('Email', Icons.email, screenSize),
              _buildTextField('Password', Icons.lock, screenSize),
              _buildTextField('Confirm Password', Icons.lock, screenSize),
              _buildTextField('City', Icons.location_city, screenSize),
              _buildTextField('School/College', Icons.school, screenSize),
              _buildTextField('Contact', Icons.phone, screenSize),
              SizedBox(height: screenSize.height * 0.02), // 2% of screen height
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentTutorScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4654BF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenSize.width * 0.15, // 15% of screen width
                      vertical: screenSize.height * 0.02, // 2% of screen height
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize:
                          screenSize.width * 0.045, // 4.5% of screen width
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02), // 2% of screen height
              Center(
                child: Text(
                  'By continuing you confirm that you agree\nwith our Terms and Conditions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    color: Colors.black,
                  ), // 3.5% of screen width
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.01,
      ), // 1% of screen height
      child: TextField(
        style: TextStyle(color: Colors.black), // Set input text color to black
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
