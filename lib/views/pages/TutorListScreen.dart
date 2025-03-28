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
    },
    {
      'Name': 'Emily Johnson',
      'Class': '11',
      'City': 'Chicago',
      'Address': '789 Oak St',
      'Contact': '555-123-4567',
      'Subjects': 'Physics, Chemistry',
      'Board': 'State Board',
      'Timings': '9 AM - 11 AM',
      'No. of days': '4',
      'Mode of tuition': 'Online',
      'Fee': '\$180',
      'Additional remarks': 'Specializes in exam preparation',
    },
    {
      'Name': 'Michael Brown',
      'Class': '9',
      'City': 'Houston',
      'Address': '321 Pine St',
      'Contact': '444-555-6666',
      'Subjects': 'Biology, Math',
      'Board': 'CBSE',
      'Timings': '11 AM - 1 PM',
      'No. of days': '5',
      'Mode of tuition': 'Offline',
      'Fee': '\$170',
      'Additional remarks': 'Hands-on practical sessions',
    },
    {
      'Name': 'Jessica Williams',
      'Class': '8',
      'City': 'Phoenix',
      'Address': '654 Maple St',
      'Contact': '333-222-1111',
      'Subjects': 'Geography, History',
      'Board': 'ICSE',
      'Timings': '1 PM - 3 PM',
      'No. of days': '2',
      'Mode of tuition': 'Online',
      'Fee': '\$160',
      'Additional remarks': 'Interactive map sessions',
    },
    {
      'Name': 'David Jones',
      'Class': '7',
      'City': 'Philadelphia',
      'Address': '987 Cedar St',
      'Contact': '222-333-4444',
      'Subjects': 'Math, Computer Science',
      'Board': 'State Board',
      'Timings': '3 PM - 5 PM',
      'No. of days': '3',
      'Mode of tuition': 'Offline',
      'Fee': '\$140',
      'Additional remarks': 'Focus on coding skills',
    },
    {
      'Name': 'Sarah Miller',
      'Class': '6',
      'City': 'San Antonio',
      'Address': '159 Birch St',
      'Contact': '111-222-3333',
      'Subjects': 'English, Art',
      'Board': 'CBSE',
      'Timings': '4 PM - 6 PM',
      'No. of days': '4',
      'Mode of tuition': 'Online',
      'Fee': '\$130',
      'Additional remarks': 'Creative writing workshops',
    },
    {
      'Name': 'Chris Davis',
      'Class': '5',
      'City': 'San Diego',
      'Address': '753 Spruce St',
      'Contact': '666-777-8888',
      'Subjects': 'Science, Math',
      'Board': 'ICSE',
      'Timings': '5 PM - 7 PM',
      'No. of days': '5',
      'Mode of tuition': 'Offline',
      'Fee': '\$120',
      'Additional remarks': 'Focus on foundational concepts',
    },
    {
      'Name': 'Patricia Wilson',
      'Class': '4',
      'City': 'Dallas',
      'Address': '852 Willow St',
      'Contact': '777-888-9999',
      'Subjects': 'History, Civics',
      'Board': 'State Board',
      'Timings': '6 PM - 8 PM',
      'No. of days': '2',
      'Mode of tuition': 'Online',
      'Fee': '\$110',
      'Additional remarks': 'Interactive history lessons',
    },
    {
      'Name': 'Robert Martinez',
      'Class': '3',
      'City': 'San Jose',
      'Address': '951 Aspen St',
      'Contact': '888-999-0000',
      'Subjects': 'Math, English',
      'Board': 'CBSE',
      'Timings': '7 PM - 9 PM',
      'No. of days': '3',
      'Mode of tuition': 'Offline',
      'Fee': '\$100',
      'Additional remarks': 'Focus on language skills',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredTutors =
        tutors.where((tutor) {
          return tutor['Name']!.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
        }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41B57F),
        title: Center(
          child: Text(
            'Tutors',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search by Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[800]!, width: 2.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTutors.length,
              itemBuilder: (context, index) {
                final tutor = filteredTutors[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF41B57F).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(tutor['Name']!),
                      subtitle: Text(
                        '${tutor['Subjects']} - ${tutor['Board']}',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TutorDetailScreen(tutor: tutor),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
