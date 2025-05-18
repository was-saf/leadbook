import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/TutorListScreen.dart';
import 'package:leadbook/views/pages/asstudent.dart';

class StudentCheckPage extends StatelessWidget {
  const StudentCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment_ind, size: 80, color: Color(0xFF4654BF)),
              SizedBox(height: screenSize.height * 0.03),
              Text(
                'Have you completed your student profile?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenSize.height * 0.04),
              ElevatedButton.icon(
                icon: Icon(Icons.check),
                label: Text('Yes, Continue'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => TutorListScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF41B57F),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              ElevatedButton.icon(
                icon: Icon(Icons.edit),
                label: Text('No, Fill Now'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => AsStudent()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
