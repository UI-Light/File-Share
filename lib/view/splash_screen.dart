import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    logoAnimation = Tween<double>(begin: 0.0, end: 19.0).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.5, curve: Curves.elasticOut)),
    );

    nameAmination = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.5,
          0.8,
          curve: Curves.easeIn,
        ),
      ),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: nameAmination,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    top: 400,
                    left: -nameAmination.value,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: logoAnimation,
                        builder: (context, child) => Transform.rotate(
                          angle: logoAnimation.value,
                          child: Image.asset("assets/share_logo.png"),
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: RotationTransition(
                  //     turns: logoAnimation,
                  //     child: Image.asset("assets/share_logo.png"),
                  //   ),
                  // ),

                  Positioned(
                    top: 400,
                    left: 150.0 + nameAmination.value,
                    // right: nameAmination.value,
                    child: Text(
                      'File Share',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            }));
  }
}
