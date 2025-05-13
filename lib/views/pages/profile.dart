import 'package:flutter/material.dart';
import 'dart:io';

import 'package:leadbook/views/pages/profileInfo.dart';

class Profile extends StatelessWidget {
  final File? imageFile;

  Profile({this.imageFile});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.04),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    imageFile != null ? FileImage(imageFile!) : null,
                child:
                    imageFile == null
                        ? Icon(Icons.person, size: 50, color: Colors.black45)
                        : null,
              ),
              SizedBox(height: screenSize.height * 0.015),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => UserInformationScreen()),
                  );
                },
                child: Text(
                  'Humnah Khan',
                  style: TextStyle(
                    color: Colors.black87,
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
                    MaterialPageRoute(builder: (_) => UserInformationScreen()),
                  );
                },
              ),
              _buildProfileButton(
                context,
                icon: Icons.lock,
                label: 'Password Manager',
                onTap: () {},
              ),
              _buildProfileButton(
                context,
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {},
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
