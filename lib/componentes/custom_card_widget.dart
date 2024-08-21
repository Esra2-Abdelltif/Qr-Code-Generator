import 'package:flutter/material.dart';
import 'package:qr_code_generator/componentes/shared_btn.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String? buttonText;
  final void Function()? onPressed;
  final Widget? btn;

  const CustomCardWidget({super.key,
    required this.imagePath,
     this.buttonText,
     this.onPressed,
    this.btn
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 200,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 130,
            height: 130,
          ),
          const SizedBox(
            height: 50,
          ),

          btn?? SharedBtn(
            onPressed: onPressed,
            btnText: buttonText!,
          )
        ],
      ),
    );
  }
}
