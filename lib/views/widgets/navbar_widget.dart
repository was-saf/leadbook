import 'package:flutter/material.dart';
import 'package:leadbook/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0, left: 16.0, right: 16.0),
      child: SizedBox(
        height: 85,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF4654BF),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: ValueListenableBuilder(
                valueListenable: selectedPageNotifier,
                builder: (context, selectedPage, child) {
                  return NavigationBarTheme(
                    data: NavigationBarThemeData(
                      backgroundColor: Colors.transparent,
                      indicatorColor: Colors.white24,
                      labelTextStyle: MaterialStateProperty.all(
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      iconTheme: MaterialStateProperty.all(
                        const IconThemeData(color: Colors.white, size: 26),
                      ),
                      height: 55, // NavigationBar inside height
                    ),
                    child: NavigationBar(
                      selectedIndex: selectedPage,
                      onDestinationSelected: (int index) {
                        selectedPageNotifier.value = index;
                      },
                      destinations: const [
                        NavigationDestination(
                          icon: Icon(Icons.search),
                          label: 'Search',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.bar_chart),
                          label: 'Progress',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                        ),
                      ],
                      labelBehavior:
                          NavigationDestinationLabelBehavior.onlyShowSelected,
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
