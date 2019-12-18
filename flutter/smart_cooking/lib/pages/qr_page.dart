import 'dart:convert';

import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/qr_bloc.dart';
import 'package:smart_cooking/common/utils.dart';
import 'package:smart_cooking/custom-painters/custom_flushbar.dart';
import 'package:smart_cooking/custom-painters/qr_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRPage extends StatefulWidget {
  const QRPage({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;
  QRBloc _bloc = QRBloc();

  void _onQRViewCreated(QRViewController controller) {
    final channel = controller.channel;
//    controller.init(qrKey);
    this.controller = controller;
    channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case "onRecognizeQR":
          dynamic arguments = call.arguments;
          setState(() {
            qrText = arguments.toString();
            _bloc.setUserWorkplace(json.decode(qrText)).then((_){
              Navigator.pop(context);
              showFlushBar(context, EngStrings.WORKPLACE, EngStrings.OK, (){});
            }).catchError((_){
              WalletUtils.showErrorSnackbar(context, EngStrings.NO_INTERNET);
            });
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan QR code',
                style: Theme.of(context).textTheme.display2,
              ),
              Center(
                child: CustomPaint(
                  painter: QRPainter(),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
