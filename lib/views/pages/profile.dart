import 'package:flutter/material.dart';
import 'package:leadbook/main.dart';
import 'package:leadbook/views/pages/passwordmanagerpage.dart';
import 'package:leadbook/views/pages/profileInfo.dart';
import 'dart:io';

class Profile extends StatelessWidget {
  final File? imageFile;
  final String role;

  Profile({this.imageFile, this.role = 'tutor'});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final iconBgColor = isDark ? Colors.grey[800] : Colors.grey[200];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.04),
              CircleAvatar(
                radius: 50,
                backgroundColor: iconBgColor,
                backgroundImage:
                    imageFile != null ? FileImage(imageFile!) : null,
                child:
                    imageFile == null
                        ? Icon(Icons.person, size: 50, color: Colors.grey)
                        : null,
              ),
              SizedBox(height: screenSize.height * 0.015),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileInfoPage(role: role),
                    ),
                  );
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width * 0.045,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.04),
              _buildProfileButton(
                context,
                icon: Icons.person,
                label: 'Personal Information',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileInfoPage(role: role),
                    ),
                  );
                },
              ),
              _buildProfileButton(
                context,
                icon: Icons.lock,
                label: 'Password Manager',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PasswordManagerPage()),
                  );
                },
              ),
              _buildProfileButton(
                context,
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MyApp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenSize.width * 0.04,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4654BF),
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
