import 'package:flutter/material.dart';

class AsStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.08; // Consistent padding with AsTutor

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: padding * 0.9,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'LEAD BOOK',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF41B57F), // Matched color
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Center(
                child: Text(
                  'Register as Student',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.025),
              _buildTextField(
                'Name',
                'Enter Full Name',
                screenSize,
                icon: Icons.person,
              ),
              _buildTextField(
                'Class',
                'Enter Your Class',
                screenSize,
                icon: Icons.school,
              ),
              _buildTextField(
                'City',
                'Karachi (carried over from signup)',
                screenSize,
                icon: Icons.location_city,
              ),
              _buildTextField(
                'School/College',
                'APS Faisal (carried over from sign up)',
                screenSize,
                icon: Icons.account_balance,
              ),
              _buildTextField(
                'Contact',
                '0311-0274015 (carried over from sign up)',
                screenSize,
                icon: Icons.phone,
              ),
              _buildTextField(
                'Subjects',
                'Enter Name of Subjects',
                screenSize,
                icon: Icons.book,
              ),
              _buildTextField(
                'Board',
                'Enter Your Board',
                screenSize,
                icon: Icons.account_balance,
              ),
              SizedBox(height: screenSize.height * 0.04),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF41B57F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.18,
                      vertical: screenSize.height * 0.02,
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.045,
                      color: Colors.white,
                    ),
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

  Widget _buildTextField(
    String label,
    String hint,
    Size screenSize, {
    IconData? icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.01, // Reduced spacing between fields
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenSize.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          SizedBox(
            height: screenSize.height * 0.065,
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: icon != null ? Icon(icon) : null,
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.015,
                  horizontal: 15.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
