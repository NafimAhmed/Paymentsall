


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_layout.dart';


class MobileRechargeConfirmation extends StatefulWidget {

  final String amount,connectiontype,oprerator,number;
  const MobileRechargeConfirmation({Key? key, required this.amount, required this.connectiontype, required this.oprerator, required this.number}) : super(key: key);

  @override
  State<MobileRechargeConfirmation> createState() => _MobileRechargeConfirmationState();
}

class _MobileRechargeConfirmationState extends State<MobileRechargeConfirmation> with TickerProviderStateMixin{


// class MobileRechargeConfirmation extends StatelessWidget
// {
//
//   final String amount,connectiontype,oprerator,number;
//
//
//   const MobileRechargeConfirmation({super.key, required this.amount, required this.connectiontype, required this.oprerator, required this.number});

  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=.99){

      controller.stop();

      Fluttertoast.showToast(
          msg: "Done Recharge",
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



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Mobile Recharge Confirmation',style: TextStyle(color: Colors.black,fontSize: 19)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 500,width: 320,
            decoration: BoxDecoration(
                border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Text(widget.number,
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
                        Column(children:[Text('Amount :\n৳ ${widget.amount}', style: GoogleFonts.openSans(fontSize: 18.0))]),
                        Column(children:[Text('New Balance :\n৳ 21.00', style: GoogleFonts.openSans(fontSize: 18.0))]),
                      ]),

                      TableRow( children: [
                        Column(children:[Text('Connection : \n${widget.connectiontype}', style: GoogleFonts.openSans(fontSize: 16.0))]),
                        Column(children:[Text("Operator :\n${widget.oprerator}", style: GoogleFonts.openSans(fontSize: 16.0))]),
                      ]),


                    ],
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xFFFFF8F8),
                    color: Color(0xFFF59191),
                    minHeight: 8,
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),



                ////////////////////////////


                InkWell(
                  onTapDown: (Detail) async {
                    //startRecording();
                    controller.repeat();

                    if(controller.value>=1){

                      controller.stop();

                    }

                  },
                  child: Container(
                    padding: EdgeInsets.all(40),
                    margin: EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      // border: Border.all(width: 3.0),   // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(70.0)), // Set rounded corner radius
                      //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                    ),

                    child: Text("Tap to Confirm",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                  ),
                  onTapUp: (detail) {
                    controller.stop();


                    // Fluttertoast.showToast(
                    //     msg: controller.value.toString(),
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.CENTER,
                    //     timeInSecForIosWeb: 1,
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0
                    // );
                    controller.reset();

                  },

                ),

                // GestureDetector(
                //   onTap: () async {
                //     //startRecording();
                //   },
                //   child: Container(
                //     padding: EdgeInsets.all(40),
                //     margin: EdgeInsets.all(20),
                //
                //     decoration: BoxDecoration(
                //       color: Colors.red.shade300,
                //       // border: Border.all(width: 3.0),   // Set border width
                //       borderRadius: BorderRadius.all(
                //           Radius.circular(70.0)), // Set rounded corner radius
                //       //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                //     ),
                //
                //     child: Text("Tap to Confirm",
                //       style: GoogleFonts.openSans(
                //         color: Colors.white,
                //           fontSize: 25
                //       ),
                //     ),
                //   ),
                //   onLongPressDown: (details) {
                //     // startRecordingTimer();
                //     // startRecording();
                //     // stopwatch.start();
                //
                //     Fluttertoast.showToast(
                //         msg: "onLongPressDown",
                //         toastLength: Toast.LENGTH_SHORT,
                //         gravity: ToastGravity.CENTER,
                //         timeInSecForIosWeb: 1,
                //         backgroundColor: Colors.red,
                //         textColor: Colors.white,
                //         fontSize: 16.0
                //     );
                //
                //   },
                //   onLongPressUp: () {
                //
                //     Fluttertoast.showToast(
                //         msg: "onLongPressUP",
                //         toastLength: Toast.LENGTH_SHORT,
                //         gravity: ToastGravity.CENTER,
                //         timeInSecForIosWeb: 1,
                //         backgroundColor: Colors.red,
                //         textColor: Colors.white,
                //         fontSize: 16.0
                //     );
                //     // stopwatch.stop();
                //     // var timeElapsedInSeconds =     stopwatch.elapsed.inSeconds;
                //     // print("Time elapsed: $timeElapsedInSeconds");
                //   },
                // )


              ],
            ),
          ),
        ),
      ),
    );
  }

}