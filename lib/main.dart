import 'package:flutter/material.dart';
import 'common/strings.dart';
import 'screens/intro_screen.dart';

/// Punctul de intrare al aplicației.
void main() {
  runApp(const MyApp());
}

/// Widget-ul rădăcină.
/// Definește tema globală și ecranul de pornire.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      // Ecranul de pornire este acum IntroScreen
      // IntroScreen va naviga singur la WelcomeScreen
      home: const IntroScreen(),
    );
  }
}
