import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:qr_code_generator/functions/is_text_url_fun.dart';
import 'package:qr_code_generator/widget/shared_action_icon_widget.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class QrTextAction extends StatelessWidget {
  final String textQrCodeScan;

  const QrTextAction({super.key, required this.textQrCodeScan});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isUrl(textQrCodeScan) ?
          SharedActionIconWidget(
            onTap: () async{
              final Uri url = Uri.parse(textQrCodeScan);
              if (!await launchUrl(
                url,
                mode: LaunchMode.inAppBrowserView,
                browserConfiguration: const BrowserConfiguration(showTitle: true),
              )) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Could not launch $url"),backgroundColor: Colors.red,));
                throw Exception('Could not launch $url');
              }
            },
            actionIcon:  Icons.open_in_browser,
            actionText: "Open",
          ):
          SharedActionIconWidget(
            onTap: () async{
              final Uri url = Uri.parse("https://www.google.com/search?q=$textQrCodeScan");
              if (!await launchUrl(
                url,
                mode: LaunchMode.inAppBrowserView,
                browserConfiguration: const BrowserConfiguration(showTitle: true),
              )) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Could not launch $url"),backgroundColor: Colors.red,));
                throw Exception('Could not launch $url');
              }
            },
            actionIcon:  Icons.search,
            actionText: "Web Search",
          ),
          SharedActionIconWidget(
            onTap:  () {
              Clipboard.setData(ClipboardData(text:textQrCodeScan)).then((_){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("copied to clipboard"),backgroundColor: AppColors.primaryColor,));
              });
            },
            actionIcon:  Icons.copy,
            actionText: "copy",
          ),
          SharedActionIconWidget(
            onTap: ()async {
              await Share.share(textQrCodeScan);

            },
            actionIcon:  Icons.share,
            actionText: "share",
          ),

        ]
        ,),
    );
  }
}
