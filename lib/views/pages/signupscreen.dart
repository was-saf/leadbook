import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/loginscreen.dart';
import 'package:leadbook/views/pages/signup_details_screen.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                  'Create an account',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Sign Up with your Email',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                _buildInputField('Email', 'Example@email.com', emailController),
                SizedBox(height: screenSize.height * 0.01),
                _buildInputField(
                  'Password',
                  'At least 8 characters',
                  passwordController,
                  obscure: true,
                ),
                SizedBox(height: screenSize.height * 0.01),
                _buildInputField(
                  'Confirm Password',
                  'Should match',
                  confirmPasswordController,
                  obscure: true,
                ),
                SizedBox(height: screenSize.height * 0.01),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpDetailsScreen()),
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
                SizedBox(height: screenSize.height * 0.01),
                Row(
                  children: <Widget>[
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.01),
                _buildSocialButton(
                  'Continue with Google',
                  'assets/images/google.png',
                ),
                SizedBox(height: screenSize.height * 0.01),
                _buildSocialButton(
                  'Continue with Facebook',
                  'assets/images/facebook.png',
                ),
                SizedBox(height: screenSize.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF4654BF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    String hint,
    TextEditingController controller, {
    bool obscure = false,
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
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
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

  Widget _buildSocialButton(String label, String iconPath) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(iconPath, height: 24, width: 24),
      label: Text(label, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF1F1F1),
        minimumSize: Size(double.infinity, 50),
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
    );
  }
}
