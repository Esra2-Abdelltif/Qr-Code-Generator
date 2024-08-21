import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/styles.dart';

class SharedTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? fun;
  const SharedTextFieldWidget({super.key,required this.fun,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child:  TextField(
          keyboardType: TextInputType.text,
          controller: controller,
          onChanged: fun,
          cursorColor: AppColors.textFeaildColor,
          decoration:  InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: 'Enter Text',
            labelStyle: TextStyle(color: AppColors.textFeaildColor,),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor, width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
          ),
        ),
      ),);
  }
}
