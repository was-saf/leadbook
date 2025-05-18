import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileInfoPage extends StatefulWidget {
  final String role; // "student" or "tutor"

  const ProfileInfoPage({required this.role});

  @override
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String> uploadedFiles = {};
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final Map<String, String> _studentFields = {
    'Name': 'Enter your name',
    'Email': 'Enter email',
    'City': 'Enter your city',
    'School/College': 'Enter school or college',
    'Grade': 'e.g. 10th, A-Level',
    'Subjects': 'e.g. Math, Science',
    'Board': 'e.g. CBSE, ICSE',
    'Timings': 'Available hours',
    'No. of Days': 'Days per week',
    'Mode of Tuition': 'Online/In-person',
    'Fees': 'Expected fee',
    'Remarks': 'Any additional notes',
  };

  final Map<String, String> _tutorFields = {
    'Name': 'Enter your name',
    'Email': 'Enter email',
    'City': 'Enter your city',
    'School/College': 'Enter school or college',
    'Qualifications': 'Your degrees or certifications',
    'Subjects': 'Subjects you can teach',
    'Board': 'Boards you can teach',
    'Timings': 'Available hours',
    'No. of Days': 'Days per week',
    'Fees': 'Your hourly/weekly fee',
    'Remarks': 'Any additional notes',
  };

  final List<String> _tutorPdfFields = [
    'Upload CV',
    'Upload ID Card Front',
    'Upload ID Card Back',
  ];

  @override
  void initState() {
    super.initState();
    final fields = widget.role == 'student' ? _studentFields : _tutorFields;
    for (var key in fields.keys) {
      _controllers[key] = TextEditingController();
    }
    for (var field in _tutorPdfFields) {
      uploadedFiles[field] = '';
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a photo'),
              onTap: () async {
                final picked = await _picker.pickImage(
                  source: ImageSource.camera,
                );
                if (picked != null) {
                  setState(() {
                    _profileImage = File(picked.path);
                  });
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              onTap: () async {
                final picked = await _picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (picked != null) {
                  setState(() {
                    _profileImage = File(picked.path);
                  });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isStudent = widget.role == 'student';
    final fields = isStudent ? _studentFields : _tutorFields;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Profile (${isStudent ? 'Student' : 'Tutor'})',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF4654BF),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: screenSize.height * 0.02),

                  // Avatar with Icon or Picked Image
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        backgroundImage:
                            _profileImage != null
                                ? FileImage(_profileImage!)
                                : null,
                        child:
                            _profileImage == null
                                ? Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.black45,
                                )
                                : null,
                      ),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit, color: Color(0xFF4654BF)),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenSize.height * 0.02),

                  ...fields.entries.map(
                    (entry) => _buildInputField(
                      label: entry.key,
                      hint: entry.value,
                      controller: _controllers[entry.key]!,
                    ),
                  ),

                  if (!isStudent)
                    ..._tutorPdfFields.map(
                      (label) => _buildFileUploadField(label, screenSize),
                    ),

                  SizedBox(height: screenSize.height * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profile updated')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4654BF),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SizedBox(height: 2),
          TextFormField(
            controller: controller,
            validator:
                (value) => value == null || value.isEmpty ? 'Required' : null,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Color(0xFFF5F6FA),
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadField(String label, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenSize.width * 0.04,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          ElevatedButton(
            onPressed: () {
              setState(() {
                uploadedFiles[label] = 'document.pdf'; // mock file
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.015,
                horizontal: 15.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  uploadedFiles[label]!.isEmpty
                      ? 'Choose File'
                      : uploadedFiles[label]!,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: screenSize.width * 0.04,
                  ),
                ),
                Icon(Icons.upload_file, color: Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
