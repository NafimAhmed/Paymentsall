import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_layout.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
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
                  BarcodeWidget(
                    barcode: Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                    ),
                    data: '01797609439',
                    width: 200,
                    height: 200,
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

                onPressed: () {

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

                onPressed: () {

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
