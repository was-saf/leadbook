import 'package:flutter/material.dart';
import 'package:leadbook/data/notifiers.dart';
import 'package:leadbook/views/widget_tree.dart';

class AsTutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.05; // Overall screen padding

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: padding * 0.5, // Keeps vertical balance
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'LEAD BOOK',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF41B57F),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Center(
                child: Text(
                  'Register as Tutor',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.025),
              _buildTextFormField(
                'Name',
                'Enter Full Name',
                screenSize,
                icon: Icons.person,
              ),
              _buildTextFormField(
                'Qualifications',
                'Enter Your Qualifications',
                screenSize,
                icon: Icons.school,
              ),
              _buildTextFormField(
                'Address',
                'Enter Complete Address',
                screenSize,
                icon: Icons.location_on,
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
              SizedBox(height: screenSize.height * 0.04),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    selectedPageNotifier.value = 1;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WidgetTree();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF41B57F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.18,
                      vertical: screenSize.height * 0.02,
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
              ),
              SizedBox(height: screenSize.height * 0.03),
            ],
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
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenSize.width * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          SizedBox(
            height: screenSize.height * 0.065,
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
              ), // Set input text color to black
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black45),
                prefixIcon: icon != null ? Icon(icon) : null,
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.015,
                  horizontal: 15.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadField(String label, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenSize.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenSize.height * 0.005),
          ElevatedButton(
            onPressed: () {
              // Handle file upload
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
