import 'package:flutter/material.dart';
import 'package:leadbook/views/pages/loginscreen.dart';
import 'package:leadbook/views/pages/SignUpScreen.dart';

class SignUpLoginScreen extends StatefulWidget {
  @override
  _SignUpLoginScreenState createState() => _SignUpLoginScreenState();
}

class _SignUpLoginScreenState extends State<SignUpLoginScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_SlideContent> slides = [
    _SlideContent(
      imagePath: 'assets/images/1.png',
      title: 'Unlock Your Learning Potential',
      subtitle:
          'Discover courses, track progress,\nand achieve your academic goals',
    ),
    _SlideContent(
      imagePath: 'assets/images/2.png',
      title: 'Expert Tutors at Your Fingertips',
      subtitle:
          'Find knowledgeable tutors, schedule sessions,\nand master any subject with ease',
    ),
    _SlideContent(
      imagePath: 'assets/images/3.png',
      title: 'Effortless Learning for Everyone',
      subtitle:
          'Simplified lessons, step-by-step guidance,\nand a seamless learning experience',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.02),
            Image.asset(
              'assets/images/Group_29.png',
              height: screenSize.height * 0.2,
            ),
            SizedBox(height: screenSize.height * 0.015),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final slide = slides[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        slide.imagePath,
                        height: screenSize.height * 0.3,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: screenSize.height * 0.04),
                      Text(
                        slide.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4654BF),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Text(
                        slide.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.035,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slides.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 12 : 8,
                  height: _currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == index
                            ? Color(0xFF4654BF)
                            : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4654BF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.02,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.05),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4654BF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.02,
                        ),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Text(
              'Learn. Grow. Succeed.',
              style: TextStyle(
                fontSize: screenSize.width * 0.04,
                color: Color(0xFF4654BF),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
          ],
        ),
      ),
    );
  }
}

class _SlideContent {
  final String imagePath;
  final String title;
  final String subtitle;

  _SlideContent({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}
