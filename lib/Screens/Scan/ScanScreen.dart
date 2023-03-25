import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/app_layout.dart';
import '../RecentTransfer/RecenTransferScreen.dart';



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

                  pdfQR();

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

                onPressed: () async {

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



  //////////////////////////////////////////////////



  Future<Uint8List> pdfQR() async {
    final pdf = pw.Document();
    final ByteData bytes = await rootBundle.load('assets/images/Payments_All.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    pdf.addPage(
        pw.Page(
            build: (pw.Context context){
              return pw.Center(
                child: pw.Padding(
                  padding: pw.EdgeInsets.all(16.0),
                  child: pw.Column(
                    children: [
                      pw.Container(
                          height: 600,
                          width: 700,
                          child: pw.Padding(
                              padding: pw.EdgeInsets.all(16.0),


                              child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [

                                    pw.Center(
                                      child: pw.Stack(
                                        alignment: pw.Alignment.center,
                                        children: [
                                          pw.Center(
                                            child: pw.BarcodeWidget(
                                              barcode: Barcode.qrCode(
                                                errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                                              ),
                                              data: '$phonenumber',
                                              width: 300,
                                              height: 300,
                                            ),
                                          ),
                                          pw.Container(
                                            color: PdfColors.white,
                                            width: 60,
                                            height: 60,
                                            child: pw.Image(pw.MemoryImage(byteList),),
                                          ),

                                        ],
                                      ),
                                    ),

                                  ]
                              )
                          )
                      ),
                      pw.SizedBox(height: 30),
                      pw.Text('The QR Code has been generated electronically.'),
                      pw.Text('Thank You.'),
                    ]
                  )
                )
              );

            }
        )
    );
    final String directory = (await getApplicationDocumentsDirectory()).path;
    final String path = '$directory/Transaction.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);
    return pdf.save();
  }




//////////////////////////////////////////////




}
