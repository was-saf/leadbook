import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/grade9/grade9chemistry/grade9chemistryexercisesolutions.dart';
import 'package:leadbook/views/pages/grade9/grade9chemistry/grade9chemistrymcqs.dart';
import 'package:leadbook/views/pages/grade9/grade9chemistry/grade9chemistrynotes.dart';
import 'package:leadbook/views/pages/grade9/grade9chemistry/grade9chemistrypastpapers.dart';
import 'package:leadbook/views/pages/grade9/grade9chemistry/grade9chemistrypracticeexercises.dart';

class Grade9Chemistry extends StatelessWidget {
  const Grade9Chemistry({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> options = [
      {'title': 'MCQs', 'screen': const Grade9ChemistryMCQs()},
      {'title': 'Past Papers', 'screen': const Grade9ChemistryPastPapers()},
      {'title': 'Notes', 'screen': const Grade9ChemistryNotes()},
      {
        'title': 'Practice Exercises',
        'screen': const Grade9ChemistryPracticeExercises(),
      },
      {
        'title': 'Exercise Solutions',
        'screen': const Grade9ChemistryExerciseSolutions(),
      },
    ];

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Grade 9 > Chemistry',
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
          const SizedBox(height: 20),
          // Options List
          Expanded(
            child: ListView.separated(
              itemCount: options.length,
              separatorBuilder:
                  (context, index) => Divider(
                    color: isDarkMode ? Colors.white24 : Colors.black26,
                    height: 1,
                  ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    options[index]['title'],
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => options[index]['screen'],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
