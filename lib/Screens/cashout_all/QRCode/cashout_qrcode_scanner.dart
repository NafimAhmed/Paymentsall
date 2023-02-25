

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../cashout_amount.dart';



class CashOutQRCodeScanner extends StatefulWidget
{
  @override
  State<CashOutQRCodeScanner> createState() => _HomeState();
}

class _HomeState extends State<CashOutQRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;


  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: (result == null)
          //         ? Text("Scan a Code")
          //     //Text('Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //
          //         : Text('Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //   ),
          // )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
     // setState(() {

        if(result!=null){

          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CashoutAmount(agentNumber: result!.code.toString(),);
              },
            ),
          );


        }


        result = scanData;

      //});


    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }







}