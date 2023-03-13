import 'dart:io';
import 'dart:ui';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/app_layout.dart';

// class ScanScreen extends StatefulWidget {
//   const ScanScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }
//
// final GlobalKey barcodeKey = GlobalKey();
//
// Future<bool> _requestPermission() async {
//   final status = await Permission.storage.request();
//   return status.isGranted;
// }
// Future<String> _getExternalStorageDirectory() async {
//   final directory = await getExternalStorageDirectory();
//   return directory!.path;
// }
// Future<File> _saveBarcodeImage(String directory, String fileName, ui.Image image) async {
//   final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//   final buffer = byteData!.buffer;
//   return await File('$directory/$fileName').writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
// }


class ScanScreen extends StatelessWidget {

  final phonenumber;

   ScanScreen({super.key, required this.phonenumber});

  final globalKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Text("Your QR code is :",
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                )
            ),


            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  RepaintBoundary(
                    child: BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: '$phonenumber',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 60,
                    height: 60,
                    child: Image.asset("assets/images/Payments_All.png"),
                  ),
                ],
              ),
            ),





            Container(
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
              child: ElevatedButton(

                onPressed: () async {

                  // try{
                  //   RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                  //   var image=await boundary.toImage(pixelRatio: 3.0);
                  //   final byteData=await image.toByteData(format: ImageByteFormat.png);
                  //   final pngBytes=byteData!.buffer.asUint8List();
                  //   final directory=await getExternalStorageDirectory();
                  //   final file = File('${directory!.path}/barcode.png');
                  //   await file.writeAsBytes(pngBytes);

                    RepaintBoundary(
                      key: globalKey,
                      child: await BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: '$phonenumber',
                        width: 200,
                        height: 100,
                      ),
                    );
                  },

                  //
                  // final permission = await _requestPermission();
                  // if (permission) {
                  //   final directory = await _getExternalStorageDirectory();
                  //   final fileName = 'barcode.png';
                  //   // final barcodeWidget = BarcodeWidget(
                  //   //   key: barcodeKey,
                  //   //   barcode: Barcode.code128(),
                  //   //   data: '$phonenumber',
                  //   //   width: 200,
                  //   //   height: 80,
                  //   //   style: TextStyle(fontSize: 20),
                  //   // );
                  //
                  //   final image = await Future.delayed(Duration(milliseconds: 20), () async {
                  //     final boundary = barcodeKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                  //     final image = await boundary.toImage(pixelRatio: 3.0);
                  //     return image;
                  //   });
                  //
                  //
                  //
                  //   //final image = await barcodeWidget.toImage(pixelRatio: 3.0);
                  //   final file = await _saveBarcodeImage(directory, fileName, image);
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text('Barcode downloaded to ${file.path}'),
                  //   ));
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text('Permission denied'),
                  //   ));
                  // }



                  // Navigator.pop(context);
                  //
                  // // Navigator.push(
                  // //     context,
                  // //     MaterialPageRoute(
                  // //         builder: (context) =>
                  // //             BottomBar()));
                  //
                  // Get.to(BottomBar(),
                  //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                  //     transition: Transition.rightToLeft );




                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 15.0),
                  primary: Colors.red.shade900,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Download QR Code",
                  style: TextStyle(color: Colors.white, fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
              child: ElevatedButton(

                onPressed: () async {





                  // Navigator.pop(context);
                  //
                  // // Navigator.push(
                  // //     context,
                  // //     MaterialPageRoute(
                  // //         builder: (context) =>
                  // //             BottomBar()));
                  //
                  // Get.to(BottomBar(),
                  //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                  //     transition: Transition.rightToLeft );




                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 15.0),
                  primary: Colors.red.shade900,
                  shape: StadiumBorder(),
                ),

                child: Text(
                  "Share QR Code",
                  style: TextStyle(color: Colors.white, fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),





          ],
        ),
      ),


    );
  }




}
