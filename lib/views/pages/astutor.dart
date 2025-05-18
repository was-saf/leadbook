import 'package:flutter/material.dart';
import 'package:leadbook/data/notifiers.dart';
import 'package:leadbook/views/widget_tree.dart';

class AsTutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.08;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: screenSize.height * 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  'LEAD BOOK',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4654BF),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  'Register as Tutor',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                _buildTextFormField(
                  'Qualifications',
                  'Enter Your Qualifications',
                  screenSize,
                  icon: Icons.school,
                ),
                _buildTextFormField(
                  'Subjects',
                  'Enter the Subjects You Can Teach',
                  screenSize,
                  icon: Icons.book,
                ),
                _buildTextFormField(
                  'Board',
                  'Enter the Board You Can Teach',
                  screenSize,
                  icon: Icons.account_balance,
                ),
                _buildTextFormField(
                  'Timings',
                  'Enter Your Available Hours',
                  screenSize,
                  icon: Icons.schedule,
                ),
                _buildTextFormField(
                  'No. Of Days',
                  'Enter Days Available Per Week',
                  screenSize,
                  icon: Icons.calendar_today,
                ),
                _buildFileUploadField('Upload CV', screenSize),
                _buildFileUploadField('Upload ID Card Front', screenSize),
                _buildFileUploadField('Upload ID Card Back', screenSize),
                _buildTextFormField(
                  'Remarks',
                  'Enter any remarks',
                  screenSize,
                  icon: Icons.comment,
                ),
                SizedBox(height: screenSize.height * 0.01),
                ElevatedButton(
                  onPressed: () {
                    selectedPageNotifier.value = 1;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => WidgetTree()),
                    );
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
                SizedBox(height: screenSize.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    String label,
    String hint,
    Size screenSize, {
    IconData? icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
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
          SizedBox(height: screenSize.height * 0.0005),
          TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black45),
              prefixIcon: icon != null ? Icon(icon) : null,
              filled: true,
              fillColor: Color(0xFFF5F6FA),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.005,
                horizontal: 16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
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
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
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
          SizedBox(height: screenSize.height * 0.0005),
          ElevatedButton(
            onPressed: () {
              // File upload logic placeholder
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.005,
                horizontal: 15.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose File',
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
