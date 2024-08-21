
import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/image.dart';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:qr_code_generator/widget/customa_app_bar.dart';
import 'package:qr_code_generator/widget/download_qr_code_widget.dart';
import 'package:qr_code_generator/widget/share_qr_code_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQRCodePage extends StatefulWidget {
  final String textQrCodeScan;
  const ScanQRCodePage({super.key,required this.textQrCodeScan});
  @override
  State<ScanQRCodePage> createState() => _ScanQRCodePageState();
}

class _ScanQRCodePageState extends State<ScanQRCodePage> {
  final GlobalKey globalKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(context: context,titleText: 'QR Code Reader'),
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
                            data: widget.textQrCodeScan,
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
                        image: AssetImage(AppImagePaths.qrBorderImage),
                        width: 250,
                        height: 250,
                      )
                    ],
                  ),
                  Center(
                    child: Text(widget.textQrCodeScan,
                      style:const TextStyle(
                          fontSize: 16,
                      ),
                    ),
                  ),
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

