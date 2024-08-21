import 'package:qr_code_generator/widget/customa_app_bar.dart';
import 'package:qr_code_generator/widget/share_qr_code_widget.dart';
import 'package:qr_code_generator/widget/shared_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:qr_code_generator/widget/download_qr_code_widget.dart';

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
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child:   RepaintBoundary(
                          key: globalKey,
                          child: QrImageView(
                            data: data,
                            version: QrVersions.auto,
                            size: 230,
                            backgroundColor: Colors.white,
                            gapless: true,
                            errorStateBuilder: (cxt, err){
                              return const Center(
                                child: Text("Error"),
                              );
                            },
                          ),
                        ),
                      ),
                      const Image(
                        image: AssetImage('assest/qrborder.png'),
                        width: 250,
                        height: 250,
                      )
                    ],
                  ),
                  SharedTextFieldWidget(controller: textController,fun: (value) {
                    setState(() {data = value;
                    });
                  },),
                  ShareQrCodeWidget(globalKey: globalKey,),
                  DownloadQrIconWidget(
                    globalKey: globalKey,
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
