import 'package:flutter/material.dart';
import 'package:leadbook/data/notifiers.dart';
import 'package:leadbook/views/pages/forgotpassword.dart';
import 'package:leadbook/views/pages/SignUpScreen.dart';
import 'package:leadbook/views/widget_tree.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  'assets/images/Group_29.PNG',
                  height: screenSize.height * 0.2,
                ),
                SizedBox(height: screenSize.height * 0.025),
                Text(
                  'Login with your account',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.045,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.04),
                _buildInputField(
                  'Email',
                  'Example@email.com',
                  controller: _emailController,
                ),
                SizedBox(height: screenSize.height * 0.02),
                _buildInputField(
                  'Password',
                  'At least 8 characters',
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(height: screenSize.height * 0.03),
                ElevatedButton(
                  onPressed: () {
                    selectedPageNotifier.value = 1;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => WidgetTree()),
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
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.025),
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
                SizedBox(height: screenSize.height * 0.02),
                _buildSocialButton(
                  'Continue with Google',
                  'assets/images/google.png',
                ),
                SizedBox(height: screenSize.height * 0.015),
                _buildSocialButton(
                  'Continue with Facebook',
                  'assets/images/facebook.png',
                ),
                SizedBox(height: screenSize.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF4654BF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
    bool obscureText = false,
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
          obscureText: obscureText,
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

  Widget _buildSocialButton(String label, String iconPath) {
    return ElevatedButton.icon(
      onPressed: () {
        selectedPageNotifier.value = 1;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => WidgetTree()),
        );
      },
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
