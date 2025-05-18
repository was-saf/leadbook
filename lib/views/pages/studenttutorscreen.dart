import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/asstudent.dart';
import 'package:leadbook/views/pages/astutor.dart';
import 'package:leadbook/views/widget_tree.dart';

class StudentTutorScreen extends StatefulWidget {
  @override
  _StudentTutorScreenState createState() => _StudentTutorScreenState();
}

class _StudentTutorScreenState extends State<StudentTutorScreen> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.07),
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
              SizedBox(height: screenSize.height * 0.04),
              Image.asset(
                'assets/images/Group_29.png', // Replace with your logo if needed
                height: screenSize.height * 0.2,
              ),
              SizedBox(height: screenSize.height * 0.03),
              Text(
                'Choose Your Role',
                style: TextStyle(
                  fontSize: screenSize.width * 0.05,
                  color: Color(0xFF4654BF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Text(
                'Knowledge Awaits – Will You Give or Receive?',
                style: TextStyle(
                  fontSize: screenSize.width * 0.035,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: screenSize.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRoleCard(
                    label: 'Student',
                    image: 'assets/images/student.png',
                    role: 'student',
                  ),
                  _buildRoleCard(
                    label: 'Tutor',
                    image: 'assets/images/tutor.png',
                    role: 'tutor',
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed:
                    selectedRole != null
                        ? () {
                          if (selectedRole == 'student') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => AsStudent()),
                            );
                          } else if (selectedRole == 'tutor') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => AsTutor()),
                            );
                          }
                        }
                        : null, // disable if nothing selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4654BF),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.25,
                    vertical: screenSize.height * 0.018,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.045,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => WidgetTree()),
                  );
                },
                child: Text(
                  'Continue without Registering',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04,
                    color: Color(0xFF4654BF),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String label,
    required String image,
    required String role,
  }) {
    final screenSize = MediaQuery.of(context).size;
    final isSelected = selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      child: Container(
        width: screenSize.width * 0.35,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF4654BF) : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: screenSize.height * 0.2,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: screenSize.width * 0.04,
                fontWeight: FontWeight.w500,
                color: isSelected ? Color(0xFF4654BF) : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
