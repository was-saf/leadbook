import 'package:flutter/material.dart';
import 'package:leadbook/data/notifiers.dart';
import 'package:leadbook/views/pages/home_page.dart';
import 'package:leadbook/views/pages/profile.dart';
import 'package:leadbook/views/pages/progress.dart';
import 'package:leadbook/views/pages/search.dart';
import 'package:leadbook/views/widgets/navbar_widget.dart';

List<Widget> pages = [Search(), HomePage(), Progress(), Profile()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.05; // 5% of screen width for padding

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Row(
            children: [
              Image.asset('assets/images/logo.png', height: screenSize.height * 0.07), // 7% of screen height
              SizedBox(width: screenSize.width * 0.02), // 2% of screen width
              Text(
                'Student Handbook',
                style: TextStyle(
                  fontSize: screenSize.width * 0.05, // 5% of screen width
                  fontWeight: FontWeight.bold,
                  color: isDarkModeNotifier.value ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  size: screenSize.width * 0.06, // 6% of screen width
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) {
            return pages.elementAt(selectedPage);
          },
        ),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
