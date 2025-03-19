import 'package:flutter/material.dart';
import 'package:leadbook/data/notifiers.dart';
import 'package:leadbook/views/pages/leadbookscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF41B57F),
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: LeadBookScreen(),
        );
      },
    );
  }
}
