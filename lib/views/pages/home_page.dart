import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/grade11/grade11.dart';
import 'package:leadbook/views/pages/grade12/grade12.dart';
import 'package:leadbook/views/pages/grade9/grade9.dart';
import 'package:leadbook/views/pages/grade10/grade10.dart';
import 'package:leadbook/views/pages/student_check_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black12 : Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(isDarkMode),
            SizedBox(height: screenSize.height * 0.01),
            _buildAdvertBanner(screenSize, isDarkMode),
            SizedBox(height: screenSize.height * 0.01),
            _buildGradeButton(
              context,
              color: Colors.amber,
              grade: 'Grade 9',
              screen: Grade9(),
            ),
            SizedBox(height: 10),
            _buildGradeButton(
              context,
              color: Colors.redAccent,
              grade: 'Grade 10',
              screen: Grade10(),
            ),
            SizedBox(height: 10),
            _buildGradeButton(
              context,
              color: Colors.green,
              grade: 'Grade 11',
              screen: Grade11(),
            ),
            SizedBox(height: 10),
            _buildGradeButton(
              context,
              color: Colors.purple,
              grade: 'Grade 12',
              screen: Grade12(),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudentCheckPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4654BF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.2,
                    vertical: screenSize.height * 0.015,
                  ),
                ),
                child: Text(
                  'Find a Tutor',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(bool isDarkMode) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search with AI ✨',
        prefixIcon: Icon(
          Icons.search,
          color: isDarkMode ? Colors.white70 : Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: isDarkMode ? Colors.grey[850] : Colors.grey[200],
      ),
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    );
  }

  Widget _buildAdvertBanner(Size screenSize, bool isDarkMode) {
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.10,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Advert Banner',
          style: TextStyle(
            fontSize: 18,
            color: isDarkMode ? Colors.white70 : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildGradeButton(
    BuildContext context, {
    required Color color,
    required String grade,
    required Widget screen,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    grade,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Maths, Physics, Chemistry, Computer Science, Biology, English',
                    style: TextStyle(
                      fontSize: 11,
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color, size: 16),
          ],
        ),
      ),
    );
  }
}
