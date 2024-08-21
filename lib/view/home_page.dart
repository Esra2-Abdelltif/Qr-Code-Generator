import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_generator/constants/image.dart';
import 'package:qr_code_generator/view/generator_qr_code_screen.dart';
import 'package:qr_code_generator/view/scan_qr_code_screen.dart';
import 'package:qr_code_generator/widget/custom_card_widget.dart';
import 'package:qr_code_generator/widget/shared_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textQrCodeScan = "";

  Future<void> scanQrCode() async{
    try{
      final qrCod = await FlutterBarcodeScanner.scanBarcode("#ff6666", "cancel", true, ScanMode.QR);
      if(qrCod.isNotEmpty && qrCod!="-1"){
        print("My code qr : $qrCod");
        textQrCodeScan = qrCod;
        await   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  ScanQRCodePage(textQrCodeScan: textQrCodeScan,),
          ),
        );
        setState(() {

        });
      }
    }on PlatformException{
      print("exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  CustomCardWidget(
                    imagePath: AppImagePaths.scanQrImage,
                    btn: GestureDetector(onTap: () => scanQrCode, child: SharedBtn(
                      onPressed: scanQrCode,
                      btnText: "Scan Qr code",
                    ),),
                  ),

                  CustomCardWidget(
                    imagePath:  AppImagePaths.generateQrImage,
                    buttonText: "Generate Qr code",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GeneratorQRCodePage(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

