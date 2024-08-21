import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:qr_code_generator/constants/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_generator/widget/shared_btn.dart';

class DownloadQrIconWidget extends StatefulWidget {
  final GlobalKey globalKey;
  const DownloadQrIconWidget({super.key,required this.globalKey});

  @override
  State<DownloadQrIconWidget> createState() => _DownloadQrIconWidgetState();
}

class _DownloadQrIconWidgetState extends State<DownloadQrIconWidget> {
  bool dirExists = false;
  Future<void> _captureAndSavePng() async {
    try{
      RenderRepaintBoundary boundary = widget.globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      dynamic externalDir =await getApplicationDocumentsDirectory();

      //Drawing White Background because Qr Code is Black
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder,Rect.fromLTWH(0,0,image.width.toDouble(),image.height.toDouble()));
      canvas.drawRect(Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);
      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      //Check for duplicate file name to avoid Override
      String fileName = 'qr_code';
      int i = 1;
      while(await File('${externalDir.path}/$fileName.png').exists()){
        fileName = 'qr_code_$i';
        print(fileName);
        i++;
      }

      // Check if Directory Path exists or not
      dirExists = await File(externalDir.path).exists();
      //if not then create the path
      if(!dirExists){
        await Directory(externalDir.path).create(recursive: true);
        dirExists = true;
      }

      final file = await File('${externalDir.path}/$fileName.png').create();

      await file.writeAsBytes(pngBytes);
      // await ImageGallerySaver.saveFile(externalDir.path,name: "qr");

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
    return  SharedBtn(
      onPressed: _captureAndSavePng,
      btnText: "Download Qr Code",
    );
  }
}
