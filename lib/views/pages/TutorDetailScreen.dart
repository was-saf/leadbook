import 'package:flutter/material.dart';

class TutorDetailScreen extends StatelessWidget {
  final Map<String, String> tutor;

  TutorDetailScreen({required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EAF6),
      appBar: AppBar(
        backgroundColor: Color(0xFF41B57F),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Updated to black
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(
                  0xFF41B57F,
                ).withOpacity(0.3), // Light green color
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF41B57F),
                ), // Matching icon color
              ),
              SizedBox(height: 12),
              ...tutor.entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 2),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          entry.value,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
