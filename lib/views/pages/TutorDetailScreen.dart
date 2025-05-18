import 'package:flutter/material.dart';

class TutorDetailScreen extends StatelessWidget {
  final Map<String, String> tutor;

  TutorDetailScreen({required this.tutor});

  final List<String> pdfFields = ['CV', 'ID Card Front', 'ID Card Back'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF4654BF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Tutor Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.03),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF4654BF).withOpacity(0.2),
                child: Icon(Icons.person, size: 50, color: Color(0xFF4654BF)),
              ),
              SizedBox(height: screenSize.height * 0.025),

              // Tutor details
              ...tutor.entries.map((entry) {
                return _buildDetailCard(entry.key, entry.value);
              }).toList(),

              SizedBox(height: screenSize.height * 0.015),

              // PDFs (Mocked)
              ...pdfFields.map((label) {
                return _buildDetailCard(label, 'document.pdf');
              }).toList(),

              SizedBox(height: screenSize.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              content,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
