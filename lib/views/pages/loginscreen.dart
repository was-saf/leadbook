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
  bool _rememberMe = false; // State for the checkbox

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
                child: Text(
                  'LEAD BOOK',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.07, // 7% of screen width
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4654BF),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: screenSize.width * 0.06, // 6% of screen width
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenSize.height * 0.005),
              Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        color: Color(0xFF4654BF),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              _buildTextField('Email', Icons.email, screenSize),
              _buildTextField('Password', Icons.lock, screenSize),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color(0xFF4654BF),
                        fontSize: screenSize.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    selectedPageNotifier.value = 1;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WidgetTree();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4654BF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.15,
                      vertical: screenSize.height * 0.02,
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log in using:',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.05),
                  _buildSocialLoginButton(
                    'assets/images/google.png',
                  ), // Google button
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ), // Space between buttons
                  _buildSocialLoginButton(
                    'assets/images/facebook.png',
                  ), // Facebook button
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
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

  Widget _buildSocialLoginButton(String assetPath) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WidgetTree();
            },
          ),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200], // Light grey background
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: 30, // Set icon size
            height: 30,
          ),
        ),
      ),
    );
  }
}
