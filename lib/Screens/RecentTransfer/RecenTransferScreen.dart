
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
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

final payReceipts=[
  PaymentDetails('Payment Date', '22 February, 2023'),
  PaymentDetails('PaymentsAll Account', '017XXXXXXXX'),
  PaymentDetails('Transaction Id', 'AMB4G5J7K6FF'),
  PaymentDetails('Paid to Organization', 'BDT 1121.00'),
  PaymentDetails('PaymentsAll Fee', 'BDT 0.00'),
];


class RecentTransferScreen extends StatelessWidget {
   RecentTransferScreen({Key? key}) : super(key: key);

   Query dbref=FirebaseDatabase.instance.ref("User_profile").child("01797609439").child("transection");


   //RxList<dynamic>? list;

  // final  commentsRef = FirebaseDatabase.instance.ref("User_profile").child("01797609439")
  //     .child("transection");





  @override
  Widget build(BuildContext context) {



    // commentsRef.onChildAdded.listen((event) {
    //
    //
    //   // A new comment has been added, so add it to the displayed list.
    // });
    // commentsRef.onChildChanged.listen((event) {
    //
    //   list=event.obs as RxList?;
    //   // A comment has changed; use the key to determine if we are displaying this
    //   // comment and if so displayed the changed comment.
    // });
    // commentsRef.onChildRemoved.listen((event) {
    //   // A comment has been removed; use the key to determine if we are displaying
    //   // this comment and if so remove it.
    // });
    //






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
                SizedBox(height: 30,),

                FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: dbref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                    return Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.shade100,
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
                                        Text("${snapshot.child("type").value}",
                                          style: GoogleFonts.openSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),


                                        Spacer(),


                                        TextButton(
                                            style: ButtonStyle(
                                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                                            ),
                                            onPressed: (){
                                             // ViewDetails();
                                            },
                                            child: Text('View Details',style: TextStyle(
                                                color: Color(0xFF800E03)
                                            ),))
                                      ],
                                    ),

                                    Text("DESCO",
                                      style: GoogleFonts.openSans(
                                          fontSize: 17,
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


                // ListView.builder(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemCount: 10,
                //     itemBuilder: (BuildContext context,int index){
                //
                //       return Container(
                //         decoration: BoxDecoration(
                //             color: Colors.red.shade100,
                //             border: Border.all(
                //               color: Colors.red.shade100,
                //             ),
                //             borderRadius: BorderRadius.all(Radius.circular(15))
                //         ),
                //
                //
                //
                //         padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),
                //         margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5),vertical: AppLayout.getHeight(10)),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //
                //             Row(
                //               children: [
                //                 Text("Pay Bill",
                //                   style: GoogleFonts.openSans(
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold
                //                   ),
                //                 ),
                //
                //
                //                 Spacer(),
                //
                //
                //                 TextButton(
                //                     style: ButtonStyle(
                //                       shadowColor: MaterialStateProperty.all(Colors.transparent),
                //                       overlayColor: MaterialStateProperty.all(Colors.transparent),
                //                     ),
                //                     onPressed: (){
                //                      // ViewDetails();
                //                     },
                //                     child: Text('View Details',style: TextStyle(
                //                         color: Color(0xFF800E03)
                //                     ),))
                //               ],
                //             ),
                //
                //             Text("DESCO",
                //               style: GoogleFonts.openSans(
                //                   fontSize: 17,
                //                   fontWeight: FontWeight.w600
                //               ),
                //             ),
                //
                //             Text("Transaction ID : DEX123546",
                //               style: GoogleFonts.openSans(
                //                   fontSize: 15,
                //                   fontWeight: FontWeight.normal
                //               ),
                //             ),
                //
                //             Text("12:50 pm, 22/02/2023",
                //
                //               style: GoogleFonts.openSans(
                //                   fontSize: 15,
                //                   fontWeight: FontWeight.normal
                //               ),
                //
                //             ),
                //
                //
                //
                //           ],
                //         ),
                //       );
                //
                //     }
                // ),
                //


              ],
            ),
          ),
        ));

  }







  Future<Uint8List> ViewDetails() async {
    final pdf = pw.Document();
    final ByteData bytes = await rootBundle.load('assets/images/desco.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    final ByteData bytes1 = await rootBundle.load('assets/images/Payments_All_Logo.png');
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
                                        child: pw.Image(pw.MemoryImage(byteList1),height: 200,width: 200)
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
                                              fontWeight: pw.FontWeight.bold),
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
                                    'Bill Information',
                                    style: pw.TextStyle(
                                        color: PdfColors.black,
                                        fontSize: 18,
                                        fontWeight: pw.FontWeight.bold ),
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
                                    ...receipts.map((e)=>pw.TableRow(
                                        children: [
                                          pw.Padding(padding: pw.EdgeInsets.only(left: 0,top: 8,bottom: 4,),
                                            child: pw.Text(e.description,
                                                style: pw.TextStyle(
                                                  color: PdfColors.black,
                                                  fontSize: 12,
                                                )
                                            ),
                                          ),

                                          pw.Padding(
                                              padding: const pw.EdgeInsets.only(left: 10,top: 8,bottom: 4,),
                                              child: pw.Text(e.others,
                                                  style: const pw.TextStyle(
                                                    color: PdfColors.grey,
                                                    fontSize: 12,
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
                                        fontWeight: pw.FontWeight.bold ),
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
                                  ...payReceipts.map((e)=>pw.TableRow(
                                      children: [
                                        pw.Padding(padding: const pw.EdgeInsets.only(left: 0,top: 8,bottom: 4,),
                                          child: pw.Text(e.descriptions,
                                              style: const pw.TextStyle(
                                                color: PdfColors.black,
                                                fontSize: 12,
                                              )
                                          ),
                                        ),

                                        pw.Padding(
                                            padding: const pw.EdgeInsets.only(left: 10,top: 8,bottom: 4,),
                                            child: pw.Text(e.other,
                                                style: const pw.TextStyle(
                                                  color: PdfColors.grey,
                                                  fontSize: 12,
                                                )
                                            )
                                        )

                                      ]
                                  ),
                                  )
                                ],

                              ),
                              pw.SizedBox(height: 10),

                              pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                                  children: [
                                    pw.Text('Payment Received',
                                        style: const pw.TextStyle(color: PdfColors.green900,fontSize: 16)
                                    ),
                                    pw.Spacer(),
                                    pw.Text('BDT 1121.00',
                                        style: const pw.TextStyle(color: PdfColors.green900,fontSize: 16)

                                    ),
                                    pw.Spacer(),
                                    pw.Text('                  ')
                                  ]
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
    return pdf.save();
    }

}
