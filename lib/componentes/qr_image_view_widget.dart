import 'package:flutter/material.dart';
import 'package:qr_code_generator/constants/image.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImageViewWidget extends StatelessWidget {
  final String textQrCodeScan;
  final GlobalKey globalKey;
  const QrImageViewWidget({super.key, required this.textQrCodeScan,required this.globalKey});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: RepaintBoundary(
            key: globalKey,
            child: QrImageView(
              data:textQrCodeScan,
              version: QrVersions.auto,
              size: 230,
              backgroundColor: Colors.white,
              gapless: true,
              errorStateBuilder: (cxt, err) {
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
    );
  }
}
