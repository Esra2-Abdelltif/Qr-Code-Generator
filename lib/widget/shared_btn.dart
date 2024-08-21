import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/styles.dart';

class SharedBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String btnText;
  const SharedBtn({super.key,required this.onPressed,required this.btnText});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      width:  MediaQuery.of(context).size.width * 0.75,
      child: RawMaterialButton(
        onPressed:onPressed,
        fillColor: AppColors.primaryColor,
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child:  Text(
          btnText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
