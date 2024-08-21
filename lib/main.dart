import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_generator/view/home_page.dart';
import 'package:qr_code_generator/view/spalsh_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(color: Colors.transparent,elevation: 0
      )),
      home: const SplashScreen(),
    );
  }
}
