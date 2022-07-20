import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evsmart/FCM/firebase_messaging.dart';
import 'package:evsmart/models/DAO/qrcodescanner_DAO.dart';
import 'package:evsmart/models/DTO/TicketUseCodeResult.dart';
import 'package:evsmart/viewModel/qrscanner_viewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

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
  final _isReady = false;

  // This widget is the root of your application.
  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  String? mtoken = " ";
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

  @override
  void initState() {
    super.initState();
    requestPermission();
    loadFCM();
    listenFCM();
    getToken();
    FirebaseMessaging.instance.subscribeToTopic("all");
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
                    : const Text('Scan a code to start')),
          )
        ],
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
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
        borderColor: Theme.of(context).colorScheme.secondary,
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

          if (snapshot.data != null) {
            TicketUseCodeResult tucr = snapshot.data;
            if (tucr.isSuccess == true) {
              return GestureDetector(
                child: const AlertDialog(
                    title: Text(
                      "Event",
                      textAlign: TextAlign.center,
                    ),
                    content: Text("Check successfully")),
                onTap: () async {
                  String name = "User1";
                  DocumentSnapshot snap = await FirebaseFirestore.instance
                      .collection("UserTokens")
                      .doc(name)
                      .get();

                  String token = snap['token'];
                  sendPushMessage(token);
                },
              );
            } else {
              return const Text('Your QR code scanner is not working properly',
                  style: TextStyle(fontSize: 20, color: Colors.redAccent));
            }
          }
          return const Text('Your QR code scanner is not working properly',
              style: TextStyle(fontSize: 20, color: Colors.redAccent));
        });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("UserTokens").doc("User1").set({
      'token': token,
    });
  }

  void sendPushMessage(String token) async {
    TicketUseCodeResult? tucr;
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAZIVF00U:APA91bHvScjC-HCgSUTb4G0m1F4vJ2vUP7qDg9RtC2p8gBM3nEO_gYY7XMrw-g3VKnoW_iXWMQxcBauP_7K5gBn_3xaQfTHpbgl_hyHV3mPjM-MeJI-X6W3bhm_jTHCT2jhP1ukjhUSt',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': "${tucr?.message} successfully!",
              'title': "Smart Event"
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
      });

      saveToken(token!);
      print(token);
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }
}
