import 'package:flutter/material.dart';
import 'package:leadbook/LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.05; // 5% of screen width for padding

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
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
                    color: Color(0xFF41B57F),
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
                        color: Color(0xFF41B57F),
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
                    // Handle continue button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF41B57F),
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
                  'By continuing you confirm that you agree\nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
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
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
