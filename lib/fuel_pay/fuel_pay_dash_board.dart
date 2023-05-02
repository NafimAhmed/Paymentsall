


import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:sizer/sizer.dart';
import 'package:pdf/widgets.dart' as pw;

import '../Screens/RecentTransfer/RecenTransferScreen.dart';
import '../utils/app_layout.dart';
import 'fuel_amount.dart';

class FuelPayDashBoard extends StatelessWidget{

  final String phoneNumber;

  FuelPayDashBoard({super.key, required this.phoneNumber});





  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("User_profile").child(phoneNumber).child("transection");


    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Fuel Pay',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.red.shade100
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox( height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 71.sp,
                        width: 53.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white
                        ),
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return FuelAmount(
                                      fuel_name: "Petrol",
                                    );
                                  },
                                ),
                              );
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Color(0xFFFFF8F8),
                                      radius: 26,
                                      child: Icon(Icons.oil_barrel_sharp,
                                        color: Colors.red.shade900,
                                        size: 40,
                                      )//Image.asset('assets/images/Quick Pay.png',),

                                    //Icon(Icons.receipt_sharp,color: Colors.black)
                                  ),
                                  const Text('Petrol',style: TextStyle(color:Color(0xFF80140E)))
                                ],
                              ),
                            )
                        ),
                      ),

                      SizedBox(width: 29.w,),


                      Container(
                        height: 71.sp,
                        width: 53.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white
                        ),
                        //margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: TextButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: (){
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return BillPayPage(
                              //         firstName: firstName,
                              //         lastName: lastName,
                              //         pin: pin,);
                              //     },
                              //   ),
                              // );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Color(0xFFFFF8F8),
                                    radius: 26,
                                    child: Icon(Icons.local_gas_station_outlined,
                                      color: Colors.red.shade900,
                                      size: 40,
                                    )//Image.asset('assets/images/bill_pay.png',),

                                  //Icon(Icons.receipt_sharp,color: Colors.black)
                                ),
                                const Text('Disel',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )
                        ),
                      ),

                      SizedBox(width: 15,),


                      // Container(
                      //   alignment: Alignment.centerRight,
                      //   child: TextButton(
                      //       style: ButtonStyle(
                      //         shadowColor: MaterialStateProperty.all(Colors.transparent),
                      //         overlayColor: MaterialStateProperty.all(Colors.transparent),
                      //       ),
                      //       onPressed: (){
                      //         // Navigator.push(
                      //         //   context,
                      //         //   MaterialPageRoute(
                      //         //     builder: (context) {
                      //         //       return BankTransferPage();
                      //         //     },
                      //         //   ),
                      //         // );
                      //       },
                      //       child: Column(
                      //         //crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           CircleAvatar(
                      //               backgroundColor: const Color(0xFFFFF8F8),
                      //               radius: 26,
                      //               child: Icon(Icons.account_balance,
                      //                 size: 40,
                      //                 color: Colors.red.shade900,
                      //               )//Image.asset('assets/images/bank_transfer.png',),
                      //           ),
                      //           Text('General\nbanking',style: TextStyle(color:Color(0xFF80140E)))
                      //         ],
                      //       )),
                      // ),




                    ],
                  ),

                  SizedBox(height: 9.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: 71.sp,
                        width: 53.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white
                        ),
                        child: TextButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: (){
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return FuelPayDashBoard();
                              //     },
                              //   ),
                              // );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Color(0xFFFFF8F8),
                                    radius: 26,
                                    child: Icon(Icons.cyclone_outlined,
                                      color: Colors.red.shade900,
                                      size: 40,
                                    )//Image.asset('assets/images/Quick Pay.png',),

                                  //Icon(Icons.receipt_sharp,color: Colors.black)
                                ),
                                const Text('Octen',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )
                        ),
                      ),

                      SizedBox(width: 30.w,),


                      Container(
                        height: 71.sp,
                        width: 53.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white
                        ),
                        //margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: TextButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: (){
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return BillPayPage(
                              //         firstName: firstName,
                              //         lastName: lastName,
                              //         pin: pin,);
                              //     },
                              //   ),
                              // );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Color(0xFFFFF8F8),
                                    radius: 26,
                                    child: Icon(Icons.ev_station_outlined,
                                      color: Colors.red.shade900,
                                      size: 40,
                                    )//Image.asset('assets/images/bill_pay.png',),

                                  //Icon(Icons.receipt_sharp,color: Colors.black)
                                ),
                                const Text('Electric',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )
                        ),
                      ),

                      SizedBox(width: 15,),


                      // Container(
                      //   alignment: Alignment.centerRight,
                      //   child: TextButton(
                      //       style: ButtonStyle(
                      //         shadowColor: MaterialStateProperty.all(Colors.transparent),
                      //         overlayColor: MaterialStateProperty.all(Colors.transparent),
                      //       ),
                      //       onPressed: (){
                      //         // Navigator.push(
                      //         //   context,
                      //         //   MaterialPageRoute(
                      //         //     builder: (context) {
                      //         //       return BankTransferPage();
                      //         //     },
                      //         //   ),
                      //         // );
                      //       },
                      //       child: Column(
                      //         //crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           CircleAvatar(
                      //               backgroundColor: const Color(0xFFFFF8F8),
                      //               radius: 26,
                      //               child: Icon(Icons.account_balance,
                      //                 size: 40,
                      //                 color: Colors.red.shade900,
                      //               )//Image.asset('assets/images/bank_transfer.png',),
                      //           ),
                      //           Text('General\nbanking',style: TextStyle(color:Color(0xFF80140E)))
                      //         ],
                      //       )),
                      // ),




                    ],
                  ),
                  SizedBox(height: 10,),








                ],
              ),
            ),


            Text("Fuel Transections : "),



            Container(
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





                        // // if(snapshot.child("Bill_type").value.toString()!=" ")
                        // //   {
                        // //     return Text("");
                        // //
                        // //   }else{
                        //
                        // return ListTile(
                        //
                        //   onTap: (){
                        //
                        //   },
                        //
                        //   leading: Image.asset("assets/images/Payments_All.png"),
                        //    title: Text("${snapshot.child("").value.toString()}"),
                        //   // subtitle: Text("${snapshot.child("Bill_type").value.toString()}"),
                        // );
                        //
                        // // }



                      })







                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: 10,
                  //     itemBuilder: (BuildContext context,int index){
                  //
                  //       return ListTile(
                  //         leading: Image.asset("assets/images/Payments_All.png"),
                  //         title: Text("Organization name"),
                  //         subtitle: Text(" Bill Type name"),
                  //
                  //         onTap: (){
                  //
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) {
                  //                 return PayBillDetails(
                  //                     firstName: widget.firstName,
                  //                     lastName: widget.lastName,
                  //                     pin: widget.pin);
                  //               },
                  //             ),
                  //           );
                  //
                  //         },
                  //
                  //       );
                  //
                  //     }
                  // )

                ],
              ),
            )






          ],
        ),
      ),
    );
  }

}