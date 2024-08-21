import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/styles.dart';

class SharedActionIconWidget extends StatelessWidget {
  final void Function()? onTap;
  final String actionText;
  final IconData actionIcon;

  const SharedActionIconWidget({super.key,required this.onTap,required this.actionIcon,required this.actionText});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Icon(
              actionIcon,
              color: AppColors.primaryColor,
              size: 30,
            ),
            SizedBox(height: 10,),
            Text(actionText,style: TextStyle
              (
                color: AppColors.textFeaildColor,
                fontSize: 14
            ),)
          ],
        ),
      ),
    );
  }
}
