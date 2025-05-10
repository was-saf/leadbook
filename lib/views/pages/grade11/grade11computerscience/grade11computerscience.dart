import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/grade11/grade11computerscience/grade11computerscienceexercisesolutions.dart';
import 'package:leadbook/views/pages/grade11/grade11computerscience/grade11computersciencemcqs.dart';
import 'package:leadbook/views/pages/grade11/grade11computerscience/grade11computersciencenotes.dart';
import 'package:leadbook/views/pages/grade11/grade11computerscience/grade11computersciencepastpapers.dart';
import 'package:leadbook/views/pages/grade11/grade11computerscience/grade11englishpracticeexercises.dart';

class Grade11ComputerScience extends StatelessWidget {
  const Grade11ComputerScience({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> options = [
      {'title': 'MCQs', 'screen': const Grade11ComputerScienceMCQs()},
      {
        'title': 'Past Papers',
        'screen': const Grade11ComputerSciencePastPapers(),
      },
      {'title': 'Notes', 'screen': const Grade11ComputerScienceNotes()},
      {
        'title': 'Practice Exercises',
        'screen': const Grade11ComputerSciencePracticeExercises(),
      },
      {
        'title': 'Exercise Solutions',
        'screen': const Grade11ComputerScienceExerciseSolutions(),
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
            color: Colors.green,
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
                  'Grade 11 > Computer Science',
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
