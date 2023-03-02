


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_layout.dart';



class MarchentPayConfirmation extends StatefulWidget{


  final String receiveNumb,totAmount,ref;

  const MarchentPayConfirmation({super.key, required this.receiveNumb, required this.totAmount, required this.ref});

  @override
  State<MarchentPayConfirmation> createState() => _MarchentPayConfirmationState();
}

class _MarchentPayConfirmationState extends State<MarchentPayConfirmation>with TickerProviderStateMixin {

  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 2),
  )..addListener(() {
    setState(() {});
  });
  bool determinate = false;

  // @override
  // void initState() {
  //   controller = AnimationController(
  //     /// [AnimationController]s can be created with `vsync: this` because of
  //     /// [TickerProviderStateMixin].
  //     vsync: this,
  //     duration: const Duration(seconds: 2),
  //   )..addListener(() {
  //     setState(() {});
  //   });
  //   controller.repeat();
  //   super.initState();
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


///////////////////////////////////////////////////////

  // Timer? countdownTimer;
  // Duration myDuration = Duration(seconds: 10);
  // @override
  // void initState() {
  //   super.initState();
  // }
  // /// Timer related methods ///
  // // Step 3
  // void startTimer() {
  //   countdownTimer =
  //       Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  // }
  // // Step 4
  // void stopTimer() {
  //   setState(() => countdownTimer!.cancel());
  // }
  // // Step 5
  // void resetTimer() {
  //   stopTimer();
  //   setState(() => myDuration = Duration(days: 5));
  // }
  // // Step 6
  // void setCountDown() {
  //   final reduceSecondsBy = 1;
  //   setState(() {
  //     final seconds = myDuration.inSeconds - reduceSecondsBy;
  //     if (seconds < 0) {
  //
  //       countdownTimer!.cancel();
  //
  //     } else {
  //       myDuration = Duration(seconds: seconds);
  //     }
  //   });
  // }
  //
  //
  //
  //


//////////////////////////////////////////////








  @override
  Widget build(BuildContext context) {

    // String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    // // Step 7
    // final hours = strDigits(myDuration.inHours.remainder(24));
    // final minutes = strDigits(myDuration.inMinutes.remainder(60));
    // final seconds = strDigits(myDuration.inSeconds.remainder(60));
    //
    // int remain=10-int.parse(seconds);



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
                  Text('Conferm your payment',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                ],
              ),
            ),

            SizedBox(height: 40,),

            Text("XYZ Store",
              style: GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),

            Text(widget.receiveNumb,
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
                    Column(children:[Text('Total :\n ৳ ${widget.totAmount}', style: GoogleFonts.openSans(fontSize: 20.0))]),
                    Column(children:[Text('New Balance :\n ৳ 21.00', style: GoogleFonts.openSans(fontSize: 20.0))]),
                  ]),

                  TableRow( children: [
                    Column(children:[Text('Refernce : \n', style: GoogleFonts.openSans(fontSize: 20.0))]),
                    Column(children:[Text(widget.ref, style: GoogleFonts.openSans(fontSize: 20.0))]),
                  ]),


                ],
              ),
            ),




            ////////////////////////////////

            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),



            ////////////////////////////









            InkWell(
              onTapDown: (Detail) async {
                //startRecording();
                controller.reset();
                controller.repeat();
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




              },

            ),









            // Text(
            //   '$hours:$minutes:${remain}',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //       fontSize: 50),
            // ),


          ],
        ),
      ),
    );
  }
}