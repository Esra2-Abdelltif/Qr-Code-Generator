import 'package:qr_code_generator/componentes/customa_app_bar.dart';
import 'package:qr_code_generator/componentes/qr_image_view_widget.dart';
import 'package:qr_code_generator/componentes/shared_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_generator/componentes/share_qr_code_widget.dart';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:qr_code_generator/componentes/download_qr_code_widget.dart';

class GeneratorQRCodePage extends StatefulWidget {
  const GeneratorQRCodePage({super.key});

  @override
  State<GeneratorQRCodePage> createState() => _GeneratorQRCodePageState();
}

class _GeneratorQRCodePageState extends State<GeneratorQRCodePage> {
  final TextEditingController textController = TextEditingController();
  final GlobalKey globalKey = GlobalKey();

  String data=" ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context,titleText: 'QR Code Generator'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Center(
            child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.7,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: AppColors.secondBackGroundColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  QrImageViewWidget(textQrCodeScan: data,globalKey: globalKey,),
                  SharedTextFieldWidget(controller: textController,fun: (value) {
                    setState(() {data = value;
                    });
                  },),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShareQrCodeWidget(
                          globalKey: globalKey,
                        ),
                        SizedBox(width: 20,),
                        DownloadQrIconWidget(
                          globalKey: globalKey,
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
