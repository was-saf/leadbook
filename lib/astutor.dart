import 'package:flutter/material.dart';

class AsTutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.08; // Overall screen padding

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: padding * 0.9, // Keeps vertical balance
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
                    color: Color(0xFF41B57F),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Center(
                child: Text(
                  'Register as Tutor',
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
                'Qualifications',
                'Enter Your Qualifications',
                screenSize,
                icon: Icons.school,
              ),
              _buildTextField(
                'Address',
                'Enter Complete Address',
                screenSize,
                icon: Icons.location_on,
              ),
              _buildTextField(
                'Subjects',
                'Enter the Subjects You Can Teach',
                screenSize,
                icon: Icons.book,
              ),
              _buildTextField(
                'Board',
                'Enter the Board You Can Teach',
                screenSize,
                icon: Icons.account_balance,
              ),
              _buildTextField(
                'Timings',
                'Enter Your Available Hours',
                screenSize,
                icon: Icons.schedule,
              ),
              _buildTextField(
                'No. Of Days',
                'Enter Days Available Per Week',
                screenSize,
                icon: Icons.calendar_today,
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ), // Slightly reduced space before button
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
              SizedBox(
                height: screenSize.height * 0.03,
              ), // Reduced bottom space
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
