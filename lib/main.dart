import 'package:expenz/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent, // Change to desired color
          elevation: 0, // Optional: remove shadow
          iconTheme: IconThemeData(
            color: Colors.black, // Change to desired icon color
          ),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
