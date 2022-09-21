import 'package:flutter/material.dart';
import 'package:my_travel_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        // accentColor: const Color(0xFFD8ECF1),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF3EBACE),
            primary: const Color(0xFF3EBACE),
            secondary: const Color(0xFFD8ECF1)),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      home: const HomeScreen(),
    );
  }
}
