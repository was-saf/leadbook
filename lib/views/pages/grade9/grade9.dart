import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/grade9/grade9biology/grade9biology.dart';
import 'package:leadbook/views/pages/grade9/grade9chemistry/grade9chemisrty.dart';
import 'package:leadbook/views/pages/grade9/grade9computerscience/grade9computerscience.dart';
import 'package:leadbook/views/pages/grade9/grade9english/grade9english.dart';
import 'package:leadbook/views/pages/grade9/grade9physics/grade9physics.dart';
import 'package:leadbook/views/pages/grade9/grade9mathematics/grade9mathematics.dart';

class Grade9 extends StatelessWidget {
  const Grade9({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> subjects = [
      {
        'name': 'Mathematics',
        'image': 'assets/images/9math.png',
        'screen': const Grade9Mathematics(),
      },
      {
        'name': 'Physics',
        'image': 'assets/images/9phy.png',
        'screen': const Grade9Physics(),
      },
      {
        'name': 'Chemistry',
        'image': 'assets/images/9chem.png',
        'screen': const Grade9Chemistry(),
      },
      {
        'name': 'Computer Science',
        'image': 'assets/images/9cs.png',
        'screen': const Grade9ComputerScience(),
      },
      {
        'name': 'Biology',
        'image': 'assets/images/9bio.png',
        'screen': const Grade9Biology(),
      },
      {
        'name': 'English',
        'image': 'assets/images/9eng.png',
        'screen': const Grade9English(),
      },
    ];

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      body: Column(
        children: [
          // Top Yellow Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 100,
            color: Colors.amber[800],
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  'Grade 9',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search with AI ✨',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Subjects Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: subjects.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return _buildSubjectCard(
                    context: context,
                    subjectName: subjects[index]['name'],
                    imagePath: subjects[index]['image'],
                    screen: subjects[index]['screen'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectCard({
    required BuildContext context,
    required String subjectName,
    required String imagePath,
    required Widget screen,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  subjectName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
