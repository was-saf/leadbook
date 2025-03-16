import 'package:flutter/material.dart';

class AsStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.05; // Consistent padding with AsTutor

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
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
                    color: Color(0xFF41B57F),
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
              _buildTextFormField(
                'Name',
                'Enter Full Name',
                screenSize,
                icon: Icons.person,
              ),
              _buildTextFormField(
                'Class',
                'Enter Your Class',
                screenSize,
                icon: Icons.school,
              ),
              _buildTextFormField(
                'City',
                'Karachi (carried over from signup)',
                screenSize,
                icon: Icons.location_city,
              ),
              _buildTextFormField(
                'School/College',
                'APS Faisal (carried over from sign up)',
                screenSize,
                icon: Icons.account_balance,
              ),
              _buildTextFormField(
                'Contact',
                '0311-0274015 (carried over from sign up)',
                screenSize,
                icon: Icons.phone,
              ),
              _buildTextFormField(
                'Subjects',
                'Enter Name of Subjects',
                screenSize,
                icon: Icons.book,
              ),
              _buildTextFormField(
                'Board',
                'Enter Your Board',
                screenSize,
                icon: Icons.account_balance,
              ),
              _buildTextFormField(
                'Timings',
                'Enter Your Available Hours',
                screenSize,
                icon: Icons.schedule,
              ),
              _buildTextFormField(
                'No. Of Days',
                'Enter Days Available Per Week',
                screenSize,
                icon: Icons.calendar_today,
              ),
              _buildTextFormField(
                'Mode of Tuition',
                'Online or In-Person',
                screenSize,
                icon: Icons.laptop,
              ),
              _buildTextFormField(
                'Fees',
                'Enter Expected Fee Range',
                screenSize,
                icon: Icons.attach_money,
              ),
              _buildTextFormField(
                'Remarks',
                'Enter any remarks',
                screenSize,
                icon: Icons.comment,
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

  Widget _buildTextFormField(
    String label,
    String hint,
    Size screenSize, {
    IconData? icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.005),
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
            child: TextFormField(
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
