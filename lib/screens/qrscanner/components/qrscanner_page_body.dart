import 'dart:io';

import 'package:camera/camera.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../mainComponent/custom_bottom_nav_bar.dart';

class QRScannerPageBody extends StatefulWidget {
  const QRScannerPageBody({Key? key}) : super(key: key);

  @override
  _QRViewState createState() => _QRViewState();
}

class _QRViewState extends State<QRScannerPageBody> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  var _isReady = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void initState() {
    super.initState();
    _setUpCamera();
  }

  void _setUpCamera() async {
    try {
      // initialize cameras
      _cameras = await availableCameras();
      // initialize camera controllers
      // Current bug for high/medium with Samsung devices
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
    } catch (_) {
      // do something on error
    }

    if (mounted) setState(() => _isReady = true);
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && mounted) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: buildQrView(context)),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code to Check-In or Check-Out'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget buildQrView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).accentColor,
        borderLength: 20,
        borderWidth: 10,
        borderRadius: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ));
}
