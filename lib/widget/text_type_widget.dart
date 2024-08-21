import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:qr_code_generator/functions/is_text_url_fun.dart';

class TextTypeWidget extends StatelessWidget {
  final String textQrCodeScan;

  const TextTypeWidget({super.key, required this.textQrCodeScan});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon( isUrl(textQrCodeScan) ?Icons.link:CupertinoIcons.text_cursor),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          isUrl(textQrCodeScan) ? "Url" : "Text",
          style: TextStyle(color: Colors.white),
        ),
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          DateFormat("MMM dd, yyyy HH:mm:ss").format(DateTime.now()),
          style: TextStyle(color: AppColors.textFeaildColor),
        ),
      ),
    );
  }
}
