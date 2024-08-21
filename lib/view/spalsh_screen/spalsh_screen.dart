import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/image.dart';
import 'package:qr_code_generator/view/home_screen/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return  AnimatedSplashScreen(
      duration: 900,
      splash: Center(child: Image.asset( AppImagePaths.qrCodeImage,)),
      nextScreen:const HomePage(),
      splashIconSize: 200,
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      splashTransition: SplashTransition.rotationTransition,


    );

  }
}