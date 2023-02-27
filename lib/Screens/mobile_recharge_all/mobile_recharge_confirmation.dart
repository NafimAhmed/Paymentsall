


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_layout.dart';

class MobileRechargeConfirmation extends StatelessWidget
{

  final String amount,connectiontype,oprerator,number;

  const MobileRechargeConfirmation({super.key, required this.amount, required this.connectiontype, required this.oprerator, required this.number});

  //const MobileRechargeConfirmation({super.key, required this.amount, required this.connectiontype, required this.oprerator});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 30,),
            SafeArea(
              child: Row(
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                  Text('Conferm your recharge',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                ],
              ),
            ),

            SizedBox(height: 40,),



            Text(number,
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.normal
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(21)),
              child: Table(

                border: TableBorder.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 1),
                children: [
                  TableRow( children: [
                    Column(children:[Text('Amount :\n ৳ $amount', style: GoogleFonts.openSans(fontSize: 20.0))]),
                    Column(children:[Text('New Balance :\n ৳ 21.00', style: GoogleFonts.openSans(fontSize: 20.0))]),
                  ]),

                  TableRow( children: [
                    Column(children:[Text('Connection : \n$connectiontype', style: GoogleFonts.openSans(fontSize: 20.0))]),
                    Column(children:[Text("Operator :\n $oprerator", style: GoogleFonts.openSans(fontSize: 20.0))]),
                  ]),


                ],
              ),
            ),



            GestureDetector(
              onTap: () async {
                //startRecording();
              },
              child: Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  // border: Border.all(width: 3.0),   // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(70.0)), // Set rounded corner radius
                  //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                ),

                child: Text("Tap to\n Confirm",
                  style: GoogleFonts.openSans(
                      fontSize: 25
                  ),
                ),
              ),
              onLongPressDown: (details) {
                // startRecordingTimer();
                // startRecording();
                // stopwatch.start();

                Fluttertoast.showToast(
                    msg: "onLongPressDown",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

              },
              onLongPressUp: () {

                Fluttertoast.showToast(
                    msg: "onLongPressUP",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                // stopwatch.stop();
                // var timeElapsedInSeconds =     stopwatch.elapsed.inSeconds;
                // print("Time elapsed: $timeElapsedInSeconds");
              },
            )


          ],
        ),
      ),
    );
  }

}