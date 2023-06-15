
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class Bill_Receipt{
  final List<BillDetails>billDetailsList;
  Bill_Receipt( this.billDetailsList);
}

class BillDetails {
  final String description;
  final String others;

  BillDetails(this.description,this.others);
}


class Payment_Receipt{
  final List<PaymentDetails>paymentDetailsList;
  Payment_Receipt(this.paymentDetailsList);
}

class PaymentDetails {
  final String descriptions;
  final String other;

  PaymentDetails(this.descriptions,this.other);

}



final receipts=[
  BillDetails('Organization Name', 'DESCO(Postpaid)'),
  BillDetails('Bill Month', 'January, 2023'),
  BillDetails('Bill Account Number', '35022942'),
  BillDetails('Bill Amount', 'BDT 1121.00'),

];

// final payReceipts=[
//   PaymentDetails('Payment Date', '22 February, 2023'),
//   PaymentDetails('PaymentsAll Account', '017XXXXXXXX'),
//   PaymentDetails('Transaction Id', 'AMB4G5J7K6FF'),
//   PaymentDetails('Paid to Organization', 'BDT 1121.00'),
//   PaymentDetails('PaymentsAll Fee', 'BDT 0.00'),
// ];


class RecentTransferScreen extends StatelessWidget {

  final String phoneNumber;
   RecentTransferScreen({Key? key, required this.phoneNumber}) : super(key: key);



   //RxList<dynamic>? list;

  // final  commentsRef = FirebaseDatabase.instance.ref("User_profile").child("01797609439")
  //     .child("transection");





  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("User_profile").child(phoneNumber).child("transection");



    return  Scaffold(
        appBar: AppBar(
          title: const Text('All Transaction',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Color(0xFFFFF8F8),
        ),
        backgroundColor: Color(0xFFFFF8F8),


        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                FirebaseAnimatedList(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  query: dbref,
                  reverse: true,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {





                    String prep=" ";
                    if(snapshot.child("transection_type").value.toString()=="Sent")
                      {
                        prep="Send to : ";
                      }
                    else if(snapshot.child("transection_type").value.toString()=="Received"){
                      prep="Received from : ";
                    }
                    return Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    border: Border.all(
                                      color: Colors.red.shade100,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),


                                padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),
                                margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5),vertical: AppLayout.getHeight(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(
                                      children: [
                                        Text("${snapshot.child("type").value.toString()}",
                                          style: GoogleFonts.openSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),


                                        Spacer(),

                                        TextButton(
                                            style: ButtonStyle(
                                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                                            ),
                                            onPressed: ()async {


                                                  final pdf = pw.Document();
                                                final ByteData bytes = await rootBundle.load('assets/images/desco.png');
                                                final Uint8List byteList = bytes.buffer.asUint8List();

                                                final ByteData bytes1 = await rootBundle.load('assets/images/paymentsAll_logo.png');
                                                final Uint8List byteList1 = bytes1.buffer.asUint8List();
                                                pdf.addPage(
                                                    pw.Page(
                                                      build: (pw.Context context){
                                                        return pw.Center(
                                                            child: pw.Container(
                                                                height: 600,
                                                                width: 700,
                                                                decoration: pw.BoxDecoration(
                                                                  border: pw.Border.all(width: 1,color: PdfColors.grey),
                                                                  borderRadius: pw.BorderRadius.circular(8.0),
                                                                ),
                                                                child: pw.Padding(
                                                                    padding: pw.EdgeInsets.all(16.0),


                                                                    child: pw.Column(
                                                                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                                                                        children: [
                                                                          pw.Row(
                                                                              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                pw.Container(
                                                                                    height: 100,width: 80,
                                                                                    child: pw.Image(pw.MemoryImage(byteList),)
                                                                                ),

                                                                                pw.Container(
                                                                                    height: 70,
                                                                                    child: pw.VerticalDivider(
                                                                                      color: PdfColors.grey,
                                                                                      thickness: 1,
                                                                                      indent: 10,
                                                                                      endIndent: 16,
                                                                                    )
                                                                                ),


                                                                                pw.Container(
                                                                                    child: pw.Image(pw.MemoryImage(byteList1),height: 80,width: 200)
                                                                                ),

                                                                                pw.Container(
                                                                                    height: 50,
                                                                                    child: pw.VerticalDivider(
                                                                                      color: PdfColors.grey,
                                                                                      thickness: 1,
                                                                                      indent: 10,
                                                                                      endIndent: 12,
                                                                                    )
                                                                                ),

                                                                                pw.Container(
                                                                                    child: pw.Text('RECEIPT',
                                                                                      style: pw.TextStyle(
                                                                                          color: PdfColors.black,
                                                                                          fontSize: 22,
                                                                                          fontWeight: pw.FontWeight.bold,
                                                                                          font: pw.Font.times()
                                                                                      ),
                                                                                      textAlign: pw.TextAlign.center,
                                                                                    )
                                                                                ),


                                                                              ]
                                                                          ),
                                                                          pw.Divider(
                                                                            color: PdfColors.grey,
                                                                            thickness: 1,
                                                                          ),

                                                                          pw.Padding(
                                                                              padding: const pw.EdgeInsets.only(
                                                                                  left: 0.0,
                                                                                  top: 8.0,
                                                                                  bottom: 12.0),
                                                                              child: pw.Text(
                                                                                '${snapshot.child("type").value.toString()} Information',
                                                                                style: pw.TextStyle(
                                                                                    color: PdfColors.black,
                                                                                    fontSize: 18,
                                                                                    fontWeight: pw.FontWeight.bold ,
                                                                                    font: pw.Font.times()
                                                                                ),
                                                                                textAlign: pw.TextAlign.center,
                                                                              )
                                                                          ),


                                                                          pw.Table(
                                                                              border: const pw.TableBorder(

                                                                                  top: pw.BorderSide(
                                                                                      color: PdfColors.grey,
                                                                                      width: 1),

                                                                                  verticalInside: pw.BorderSide(
                                                                                    color: PdfColors.grey,
                                                                                    width: 1,
                                                                                    style: pw.BorderStyle.solid,
                                                                                  ),

                                                                                  bottom: pw.BorderSide(
                                                                                    color: PdfColors.grey,
                                                                                    width: 1,
                                                                                  )
                                                                              ),


                                                                              children: [

                                                                                ...receipts.map( (e)=>pw.TableRow(
                                                                                    children: [
                                                                                      pw.Padding(padding: pw.EdgeInsets.only(left: 0,top: 8,bottom: 4,),
                                                                                        child: pw.Text(e.description,
                                                                                            style:  pw.TextStyle(
                                                                                              color: PdfColors.black,
                                                                                              fontSize: 12,
                                                                                                font: pw.Font.times()
                                                                                            )
                                                                                        ),
                                                                                      ),

                                                                                      pw.Padding(
                                                                                          padding: const pw.EdgeInsets.only(left: 10,top: 8,bottom: 4,),
                                                                                          child: pw.Text(e.others,
                                                                                              style: pw.TextStyle(
                                                                                                color: PdfColors.grey,
                                                                                                fontSize: 12,
                                                                                                  font: pw.Font.times()
                                                                                              )
                                                                                          )
                                                                                      )

                                                                                    ]
                                                                                ))
                                                                              ]
                                                                          ),

                                                                          pw.Padding(
                                                                              padding: const pw.EdgeInsets.only(
                                                                                  left: 0.0,
                                                                                  top: 12.0,
                                                                                  bottom: 12.0),
                                                                              child: pw.Text(
                                                                                'Payment Information',
                                                                                style: pw.TextStyle(
                                                                                    color: PdfColors.black,
                                                                                    fontSize: 18,
                                                                                    fontWeight: pw.FontWeight.bold ,
                                                                                    font: pw.Font.times()
                                                                                ),
                                                                                textAlign: pw.TextAlign.center,
                                                                              )
                                                                          ),


                                                                          pw.Table(
                                                                            columnWidths: {
                                                                              0: pw.FlexColumnWidth(1),
                                                                              1: pw.FlexColumnWidth(1),
                                                                            },
                                                                            border: const pw.TableBorder(

                                                                                top: pw.BorderSide(
                                                                                    color: PdfColors.grey,
                                                                                    width: 1),

                                                                                verticalInside: pw.BorderSide(
                                                                                  color: PdfColors.grey,
                                                                                  width: 1,
                                                                                  style: pw.BorderStyle.solid,
                                                                                ),

                                                                                bottom: pw.BorderSide(
                                                                                  color: PdfColors.grey,
                                                                                  width: 1,
                                                                                )
                                                                            ),

                                                                            children: [
                                                                              pw.TableRow(
                                                                                  children: [
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 0,top: 4,bottom: 4),
                                                                                        child: pw.Text('Payment Type',
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                          ),
                                                                                        )),
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 8,top: 4,bottom: 4),
                                                                                        child: pw.Text("${snapshot.child("type").value}",
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                            color: PdfColors.grey
                                                                                          ),
                                                                                        )),
                                                                                  ]
                                                                              ),

                                                                              pw.TableRow(
                                                                                children: [
                                                                                  pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 0,top: 4,bottom: 4),
                                                                                  child: pw.Text('Payment Date',
                                                                                    style: pw.TextStyle(
                                                                                      font: pw.Font.times(),
                                                                                    ),
                                                                                  )),
                                                                                  pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 8,top: 4,bottom: 4),
                                                                                      child: pw.Text("${snapshot.child("time").value}",
                                                                                        style: pw.TextStyle(
                                                                                          font: pw.Font.times(),
                                                                                            color: PdfColors.grey
                                                                                        ),
                                                                                      )),
                                                                                ]
                                                                              ),
                                                                              pw.TableRow(
                                                                                  children: [
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 0,top: 4,bottom: 4),
                                                                                        child: pw.Text('PaymentsAll Account',
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                          ),
                                                                                        )),
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 8,top: 4,bottom: 4),
                                                                                        child: pw.Text("$phoneNumber",
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                              color: PdfColors.grey
                                                                                          ),
                                                                                        )),
                                                                                  ]
                                                                              ),
                                                                              pw.TableRow(
                                                                                  children: [
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 0,top: 4,bottom: 4),
                                                                                        child: pw.Text('Transaction ID',
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                          ),
                                                                                        )),

                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 8,top: 4,bottom: 4),
                                                                                        child: pw.Text("${snapshot.key.toString()}",
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                              color: PdfColors.grey
                                                                                          ),
                                                                                        )),
                                                                                  ]
                                                                              ),
                                                                              pw.TableRow(
                                                                                  children: [
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 0,top: 4,bottom: 4),
                                                                                        child: pw.Text('Paid to Organization',
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                          ),
                                                                                        )),
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 8,top: 4,bottom: 4),
                                                                                        child: pw.Text("BDT ${snapshot.child("amount").value}",
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                              color: PdfColors.grey
                                                                                          ),
                                                                                        )),
                                                                                  ]
                                                                              ),
                                                                              pw.TableRow(
                                                                                  children: [
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 0,top: 4,bottom: 4),
                                                                                        child: pw.Text('PaymentsAll Fee',
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                          ),
                                                                                        )),
                                                                                    pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 8,top: 4,bottom: 4),
                                                                                        child: pw.Text('BDT 0.00',
                                                                                          style: pw.TextStyle(
                                                                                            font: pw.Font.times(),
                                                                                              color: PdfColors.grey
                                                                                          ),
                                                                                        )),
                                                                                  ]
                                                                              ),
                                                                            ],

                                                                          ),
                                                                          pw.SizedBox(height: 10),
                                                                          pw.Padding(padding: pw.EdgeInsets.only(right: 8,left: 0,top: 8,bottom: 4),
                                                                          child:  pw.Row(
                                                                              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                pw.Text('Payment ${snapshot.child("transection_type").value.toString()}',
                                                                                    style:  pw.TextStyle(color: PdfColors.green900,fontSize: 16,font: pw.Font.times()
                                                                                    )
                                                                                ),
                                                                                pw.SizedBox(width: 115),
                                                                                pw.Text('BDT ${snapshot.child("amount").value}',
                                                                                    style:  pw.TextStyle(color: PdfColors.green900,fontSize: 16,font: pw.Font.times())

                                                                                ),
                                                                                pw.Spacer(),
                                                                                pw.Text('                  ')
                                                                              ]
                                                                          ),
                                                                          ),

                                                                          pw.Divider(color: PdfColors.grey),
                                                                          pw.Center(
                                                                              child: pw.Text('This Receipt has been generated electronically.',
                                                                                  style: const pw.TextStyle(color: PdfColors.grey)
                                                                              )
                                                                          )
                                                                        ]
                                                                    )
                                                                )
                                                            ),
                                                        );

                                                      }
                                                    )
                                                );
                                                final String directory = (await getApplicationDocumentsDirectory()).path;
                                                final String path = '$directory/Transaction.pdf';
                                                final file = File(path);
                                                await file.writeAsBytes(await pdf.save());
                                                await OpenFile.open(file.path);
                                                await pdf.save();

                                            },
                                            child: Text('View Details',style: TextStyle(
                                                color: Color(0xFF800E03)
                                            ),))
                                      ],
                                    ),

                                    Text(prep+snapshot.child("opponent").value.toString(),
                                      style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),

                                    Text("Transaction ID : ${snapshot.key.toString()}",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),

                                    Text("Date and Time : ${snapshot.child("time").value}",

                                      style: GoogleFonts.openSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal
                                      ),

                                    ),

                                  ],
                                ),
                              );

                  },

                )

              ],
            ),
          ),
        ));

  }
}
