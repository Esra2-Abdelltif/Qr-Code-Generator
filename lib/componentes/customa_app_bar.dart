import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/styles.dart';

AppBar customAppBar({required String titleText, required BuildContext context ,bool showLeadingWidget =true}) {
  return AppBar(
    title:  Text(titleText),
    centerTitle: true,
    leading: showLeadingWidget?Row(
      children: [
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // Navigate back when the arrow is pressed
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),

      ],
    ):Container(),
  );
}