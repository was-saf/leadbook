import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/TutorDetailScreen.dart';

class TutorListScreen extends StatefulWidget {
  @override
  _TutorListScreenState createState() => _TutorListScreenState();
}

class _TutorListScreenState extends State<TutorListScreen> {
  final List<Map<String, String>> tutors = [
    {
      'Name': 'John Doe',
      'Class': '10',
      'City': 'New York',
      'Address': '123 Main St',
      'Contact': '123-456-7890',
      'Subjects': 'Math, Science',
      'Board': 'CBSE',
      'Timings': '10 AM - 12 PM',
      'No. of days': '5',
      'Mode of tuition': 'Online',
      'Fee': '\$200',
      'Additional remarks': 'Experienced in online teaching',
      'CV': 'document_cv.pdf',
      'ID Card Front': 'id_front.pdf',
      'ID Card Back': 'id_back.pdf',
    },
    {
      'Name': 'Jane Smith',
      'Class': '12',
      'City': 'Los Angeles',
      'Address': '456 Elm St',
      'Contact': '987-654-3210',
      'Subjects': 'English, History',
      'Board': 'ICSE',
      'Timings': '2 PM - 4 PM',
      'No. of days': '3',
      'Mode of tuition': 'Offline',
      'Fee': '\$150',
      'Additional remarks': 'Focus on interactive learning',
      'CV': 'document_cv.pdf',
      'ID Card Front': 'id_front.pdf',
      'ID Card Back': 'id_back.pdf',
    },
    // ... add more tutors as needed
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final filteredTutors =
        tutors.where((tutor) {
          return tutor['Name']!.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
        }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF4654BF),
        title: Text(
          'Find Tutors',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenSize.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.02),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search by Name',
                filled: true,
                fillColor: Color(0xFFF5F6FA),
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTutors.length,
                itemBuilder: (context, index) {
                  final tutor = filteredTutors[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenSize.height * 0.015),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TutorDetailScreen(tutor: tutor),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFF4654BF).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tutor['Name']!,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${tutor['Subjects']} • ${tutor['Board']}',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.037,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'City: ${tutor['City']} | Fee: ${tutor['Fee']}',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.035,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'PDFs: CV, ID Front, ID Back',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.033,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
