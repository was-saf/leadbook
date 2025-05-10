import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/grade10/grade10biology/grade10biology.dart';
import 'package:leadbook/views/pages/grade10/grade10chemistry/grade10chemisrty.dart';
import 'package:leadbook/views/pages/grade10/grade10computerscience/grade10computerscience.dart';
import 'package:leadbook/views/pages/grade10/grade10english/grade10english.dart';
import 'package:leadbook/views/pages/grade10/grade10physics/grade10physics.dart';
import 'package:leadbook/views/pages/grade10/grade10mathematics/grade10mathematics.dart';

class Grade10 extends StatelessWidget {
  const Grade10({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> subjects = [
      {
        'name': 'Mathematics',
        'image': 'assets/images/10math.png',
        'screen': const Grade10Mathematics(),
      },
      {
        'name': 'Physics',
        'image': 'assets/images/10phy.jpg',
        'screen': const Grade10Physics(),
      },
      {
        'name': 'Chemistry',
        'image': 'assets/images/10chem.jpg',
        'screen': const Grade10Chemistry(),
      },
      {
        'name': 'Computer Science',
        'image': 'assets/images/10cs.jpg',
        'screen': const Grade10ComputerScience(),
      },
      {
        'name': 'Biology',
        'image': 'assets/images/10bio.jpg',
        'screen': const Grade10Biology(),
      },
      {
        'name': 'English',
        'image': 'assets/images/10eng.jpg',
        'screen': const Grade10English(),
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
            color: Colors.redAccent,
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
                  'Grade 10',
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
