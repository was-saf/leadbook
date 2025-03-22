import 'package:flutter/material.dart';
import 'dart:io';

import 'package:leadbook/views/pages/profileInfo.dart';

class Profile extends StatelessWidget {
  final File? imageFile;

  Profile({this.imageFile});

  Widget _buildButton(String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF41B57F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Icon(icon, color: Colors.white),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
              child:
                  imageFile == null
                      ? Icon(Icons.person, size: 50, color: Colors.black)
                      : null,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Added navigation to UserInformationScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInformationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Humnah Khan',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildButton('Personal Information', Icons.person, () {}),
            SizedBox(height: 10),
            _buildButton('Password Manager', Icons.lock, () {}),
            SizedBox(height: 10),
            _buildButton('Logout', Icons.logout, () {}),
          ],
        ),
      ),
    );
  }
}
