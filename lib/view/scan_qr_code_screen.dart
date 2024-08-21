
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_generator/widget/customa_app_bar.dart';

class ScanQRCodePage extends StatefulWidget {
  const ScanQRCodePage({super.key});
  @override
  State<ScanQRCodePage> createState() => _ScanQRCodePageState();
}

class _ScanQRCodePageState extends State<ScanQRCodePage> {
  String textQrCodeScan = "";

  Future<void> scanQrCode() async{
    try{
      final qrCod = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);
      if(qrCod.isNotEmpty){
        print("My code qr : $qrCod");
        textQrCodeScan = qrCod;
        setState(() {

        });
      }
    }on PlatformException{
      print("exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context,titleText: 'QR Code Generator'),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              GestureDetector(
                onTap: ()=> scanQrCode(),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1
                      )
                  ),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.document_scanner_outlined,color: Theme.of(context).primaryColor),
                          const SizedBox(width: 10),
                          Text("Scanner",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if(textQrCodeScan.isNotEmpty)
                Center(
                  child: Text(textQrCodeScan,
                    style:const TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                )
            ],
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

