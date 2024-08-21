import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_generator/widget/shared_action_icon_widget.dart';
import 'dart:ui' as ui;

class DownloadQrIconWidget extends StatefulWidget {
  final GlobalKey globalKey;
  const DownloadQrIconWidget({super.key,required this.globalKey});

  @override
  State<DownloadQrIconWidget> createState() => _DownloadQrIconWidgetState();
}

class _DownloadQrIconWidgetState extends State<DownloadQrIconWidget> {
  bool dirExists = false;
  Future<void> convertQrCodeToImage() async{
    try {
      RenderRepaintBoundary boundary = widget.globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData = await image.toByteData(
          format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = File("$directory/qrCode.png");
      await imgFile.writeAsBytes(pngBytes);
      await ImageGallerySaver.saveFile(imgFile.path, name: "qrCode.png");
      if(!mounted)return;
      SnackBar snackBar = SnackBar(content: const Text('QR code saved to gallery',style: TextStyle(color: Colors.white),),backgroundColor: AppColors.primaryColor,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }catch(e){
  print(e.toString());
  if(!mounted)return;
  SnackBar snackBar = const SnackBar(content:Text('Something went wrong!!!',style: TextStyle(color: Colors.white),),backgroundColor:Colors.red,);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  }

  @override
  Widget build(BuildContext context) {
    return   SharedActionIconWidget(
      actionText: "Download Qr Code",
      actionIcon: Icons.download,
      onTap: convertQrCodeToImage,
    );
  }
}
