import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/loginscreen.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.08;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
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
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.015),
                Text(
                  'Please enter your email and we will send\nyou a link to return to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                _buildInputField(
                  'Email',
                  'Example@email.com',
                  controller: _emailController,
                ),
                SizedBox(height: screenSize.height * 0.035),
                ElevatedButton(
                  onPressed: () {
                    // Handle reset logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4654BF),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.025),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Go back to Login',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      color: Color(0xFF4654BF),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    String hint, {
    required TextEditingController controller,
  }) {
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
            hintText: hint,
            filled: true,
            fillColor: Color(0xFFF5F6FA),
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 16.0,
            ),
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
