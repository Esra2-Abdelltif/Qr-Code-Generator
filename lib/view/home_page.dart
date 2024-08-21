import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:qr_code_generator/view/generator_qr_code_screen.dart';
import 'package:qr_code_generator/widget/custom_card_widget.dart';
import 'package:qr_code_generator/widget/shared_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SizedBox(
            // color: AppColors.textFeaildColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  CustomCardWidget(
                    imagePath: 'assest/generate.png',
                    buttonText: "Scan Qr code",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GeneratorQRCodePage(),
                      ),
                    ),
                  ),
                  CustomCardWidget(
                    imagePath:  'assest/scan.png',
                    buttonText: "Generate Qr code",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GeneratorQRCodePage(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

