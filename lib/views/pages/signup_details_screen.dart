import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/studenttutorscreen.dart';

class SignUpDetailsScreen extends StatelessWidget {
  final cityController = TextEditingController(text: "Karachi");
  final gradeController = TextEditingController(text: "11");
  final schoolController = TextEditingController(text: "The City School");

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Image.asset(
                  'assets/images/Group_29.png',
                  height: screenSize.height * 0.2,
                ),
                Text(
                  'Enter your details',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                _buildInputField('City', cityController),
                SizedBox(height: screenSize.height * 0.01),
                _buildInputField('Grade', gradeController),
                SizedBox(height: screenSize.height * 0.01),
                _buildInputField('School College', schoolController),
                SizedBox(height: screenSize.height * 0.01),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => StudentTutorScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4654BF),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.025),
                Text(
                  'By clicking continue, you agree to our\nTerms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF5F6FA),
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
