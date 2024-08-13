import 'package:file_share/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> logoAnimation;
  late Animation nameAmination;
  late Animation opacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    logoAnimation = Tween<double>(begin: 0.0, end: 19.0).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.4, curve: Curves.elasticOut)),
    );

    nameAmination = Tween<double>(begin: 75.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.3,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );

    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linearToEaseOut,
      ),
    );

    controller.forward().whenComplete(
        () => Navigator.of(context).pushReplacementNamed(Routes.homeRoute));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5072A7),
      body: AnimatedBuilder(
        animation: nameAmination,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: 360,
                left: 48,
                child: AnimatedBuilder(
                  animation: logoAnimation,
                  builder: (context, child) => Transform.rotate(
                    angle: logoAnimation.value,
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ),
              Positioned(
                top: 400,
                left: 80.0 + nameAmination.value,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: opacity.value,
                  child: AnimatedScale(
                    duration: const Duration(seconds: 3),
                    scale: 1.5,
                    child: Text(
                      'File Share',
                      style: GoogleFonts.arvo(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
