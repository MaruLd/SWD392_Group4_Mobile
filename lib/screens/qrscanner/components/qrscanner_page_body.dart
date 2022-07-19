import 'dart:io';

import 'package:evsmart/color.dart';
import 'package:evsmart/models/DAO/qrcodescanner_DAO.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/qrscanner_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../mainComponent/custom_bottom_nav_bar.dart';

class QRScannerPageBody extends StatefulWidget {
  const QRScannerPageBody(
      {Key? key, required this.ticketId, required this.ticketState})
      : super(key: key);
  final String ticketId;
  final String ticketState;
  @override
  _QRViewState createState() => _QRViewState();
}

class _QRViewState extends State<QRScannerPageBody> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  var useCodeStatus;
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
                    ? ScanFutureBuilder()
                    : Text('Scan a code to start')),
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

        if (result != null) {
          useCodeStatus = QRScannerDAO.useCode(
              ticketId: widget.ticketId, code: scanData.code ?? "");
        }
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

  Widget ScanFutureBuilder() {
    controller?.pauseCamera();
    return FutureBuilder(
        future: Get.find<QRScannerViewModel>()
            .getScannerResult(widget.ticketId, result?.code ?? ""),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.green.withOpacity(0.3),
              width: MediaQuery.of(context).size.width, //70.0,
              height: MediaQuery.of(context).size.height, //70.0,
              child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(child: CircularProgressIndicator())),
            );
          }
          if (snapshot.hasData != null) {
            return Text(snapshot.data.toString(),
                style: TextStyle(fontSize: 20, color: Colors.greenAccent));
          }
          return Text('Your QR code scanner is not working properly',
              style: TextStyle(fontSize: 20, color: Colors.redAccent));
        });
  }
}
