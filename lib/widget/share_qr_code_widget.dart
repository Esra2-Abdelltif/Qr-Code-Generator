import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_generator/widget/shared_btn.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';

import 'package:share/share.dart';
class ShareQrCodeWidget  extends StatefulWidget {
  final GlobalKey globalKey;
  const ShareQrCodeWidget({super.key,required this.globalKey});

  @override
  State<ShareQrCodeWidget> createState() => _ShareQrCodeWidgetState();
}

class _ShareQrCodeWidgetState extends State<ShareQrCodeWidget> {
  Future<void> converQrCodeToImage() async{
    RenderRepaintBoundary boundary = widget.globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile  = File("$directory/qrCode.png");
    await imgFile.writeAsBytes(pngBytes);
    await Share.shareFiles([imgFile.path],text:"Your Qr share");

  }

  @override
  Widget build(BuildContext context) {
    return   SharedBtn(
      onPressed: () {
        setState(() {
          converQrCodeToImage();                });


      },
      btnText: "Share Qr Code ",
    );
  }
}
