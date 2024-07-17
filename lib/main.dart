import 'package:file_share/core/routes/routes.dart';
import 'package:file_share/feature/home/presentation/view/home_screen.dart';
import 'package:file_share/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      routes: {
        Routes.splashRoute: (context) => const SplashScreen(),
        Routes.homeRoute: (context) => const HomeScreen(),
      },
    );
  }
}
