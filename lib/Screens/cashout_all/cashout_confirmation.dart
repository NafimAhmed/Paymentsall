


import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class CashOutConfirmation extends StatefulWidget
{
  final String totalAmount,receiversNumbe;

  const CashOutConfirmation({super.key, required this.totalAmount, required this.receiversNumbe});

  @override
  State<CashOutConfirmation> createState() => _CashOutConfirmationState();
}

class _CashOutConfirmationState extends State<CashOutConfirmation> with TickerProviderStateMixin {
  //////////////////////////////////////////////////////


  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=.90){

      controller.stop();

      Fluttertoast.showToast(
          msg: "Done",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
    setState(() {





    });
  });

  bool determinate = false;

  @override
  void dispose() {
    controller.dispose();

    Fluttertoast.showToast(
        msg: "Done",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );


    super.dispose();
  }

///////////////////////////////////////////////////////




  /////////////////////////////////////////////////////







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
                  Text('Conferm your cashout',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                ],
              ),
            ),

            SizedBox(height: 40,),

            Text("XYZ Telecom",
            style: GoogleFonts.openSans(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ),

            Text(widget.receiversNumbe,
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
                    Column(children:[Text('Total :\n ৳ ${widget.totalAmount}', style: GoogleFonts.openSans(fontSize: 20.0))]),
                    Column(children:[Text('New Balance :\n ৳ 21.00', style: GoogleFonts.openSans(fontSize: 20.0))]),
                  ]),


                ],
              ),
            ),



            ///////////////////////////////////////////

            ////////////////////////////////

            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',

            ),



            ////////////////////////////









            InkWell(
              onTapDown: (Detail) async {
                //startRecording();
                //controller.reset();
                controller.repeat();

                if(controller.value>=.99){

                  controller.stop();

                }



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
              onTapUp: (detail) {
                controller.stop();


                Fluttertoast.showToast(
                    msg: controller.value.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                controller.reset();

              },

            ),





            ////////////////////////////////////////


          ],
        ),
      ),
    );
  }


  void cashout (String sendPhoneNumber,String receiverPhoneNumber,String amount)async{


    //FirebaseDatabase database = FirebaseDatabase.instance;




    double amnt=double.parse(amount);
    ////////////////sender///////////////////////////////////////////////////////////////////////////////

    DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");

    final sendPhoneNumbersnapshotpin = await rf.child(sendPhoneNumber).child("pin").get();
    final sendPhoneNumbersnapshotfnm = await rf.child(sendPhoneNumber).child("first_name").get();
    final sendPhoneNumbersnapshotlnm = await rf.child(sendPhoneNumber).child("last_name").get();
    final sendPhoneNumbersnapshotgnm = await rf.child(sendPhoneNumber).child("gender").get();
    final sendPhoneNumbersnapshotdnm = await rf.child(sendPhoneNumber).child("dob").get();
    final sendPhoneNumbersnapshotBalance = await rf.child(sendPhoneNumber).child("balance").get();



    //////////////////sender//////////////////////////////////////////////////////////////////////////////////

    double senderBalance=double.parse(sendPhoneNumbersnapshotBalance.value.toString());

    ///////receiver///////////////////////////////////////////////////////////////////////////////

    final receiverPhoneNumbersnapshotpin = await rf.child(receiverPhoneNumber).child("pin").get();
    final receiverPhoneNumbersnapshotfnm = await rf.child(receiverPhoneNumber).child("first_name").get();
    final receiverPhoneNumbersnapshotlnm = await rf.child(receiverPhoneNumber).child("last_name").get();
    final receiverPhoneNumbersnapshotgnm = await rf.child(receiverPhoneNumber).child("gender").get();
    final receiverPhoneNumbersnapshotdnm = await rf.child(receiverPhoneNumber).child("dob").get();
    final receiverPhoneNumbersnapshotBalance = await rf.child(receiverPhoneNumber).child("balance").get();


    /////receiver/////////////////////////////////////////////////////////////////////////


    double receiverBalance=double.parse(receiverPhoneNumbersnapshotBalance.value.toString());
    double senderCurrentBalance=senderBalance-amnt;
    double receiverCurrentBalance=receiverBalance+amnt;


    bool isSennt=false;
    bool isReceived=false;

    await rf.child(sendPhoneNumber).set({
      "balance":senderCurrentBalance.toString(),
    }).then((value) {
      isSennt=true;
    });
    //}


    await rf.child(receiverPhoneNumber).set({
      "balance":receiverCurrentBalance.toString(),
    }).then((value) {
     isReceived=true;
    });
    //}

    if(isSennt && isReceived)
      {

        Fluttertoast.showToast(
            msg: "Cashout Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
    else{
      Fluttertoast.showToast(
          msg: "Something wrong. please try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }













  }






}