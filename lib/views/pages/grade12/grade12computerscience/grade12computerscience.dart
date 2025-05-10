import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/grade12/grade12computerscience/grade12computerscienceexercisesolutions.dart';
import 'package:leadbook/views/pages/grade12/grade12computerscience/grade12computersciencemcqs.dart';
import 'package:leadbook/views/pages/grade12/grade12computerscience/grade12computersciencenotes.dart';
import 'package:leadbook/views/pages/grade12/grade12computerscience/grade12computersciencepastpapers.dart';
import 'package:leadbook/views/pages/grade12/grade12computerscience/grade12englishpracticeexercises.dart';

class Grade12ComputerScience extends StatelessWidget {
  const Grade12ComputerScience({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> options = [
      {'title': 'MCQs', 'screen': const Grade12ComputerScienceMCQs()},
      {
        'title': 'Past Papers',
        'screen': const Grade12ComputerSciencePastPapers(),
      },
      {'title': 'Notes', 'screen': const Grade12ComputerScienceNotes()},
      {
        'title': 'Practice Exercises',
        'screen': const Grade12ComputerSciencePracticeExercises(),
      },
      {
        'title': 'Exercise Solutions',
        'screen': const Grade12ComputerScienceExerciseSolutions(),
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
            color: Colors.purple,
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
                  'Grade 12 > Computer Science',
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
