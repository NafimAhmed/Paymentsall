

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_layout.dart';

//import '../../utils/app_layout.dart';
//
// class PayBillconfirmation extends StatelessWidget {
//   final String firstName;
//   final String lastName;
//   const PayBillconfirmation({super.key, required this.firstName, required this.lastName});
//
//

class PayBillconfirmation extends StatefulWidget {
  final String firstName;
  final String lastName;
  const PayBillconfirmation({super.key, required this.firstName, required this.lastName});

  @override
  State<PayBillconfirmation> createState() => _PayBillconfirmationState();
}

class _PayBillconfirmationState extends State<PayBillconfirmation>with TickerProviderStateMixin {

  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=.99){

      controller.stop();

      Fluttertoast.showToast(
          msg: "Done Submission",
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


  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
//class PayBillconfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Bill Submission',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 16,bottom: 16),
          child: Container(
            height: 550,width: 320,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: const Color(0xFFFCDEDE),),
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30,),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Receiver : "),

                      ListTile(
                        leading: Image.asset("assets/images/Payments_All.png"),
                        title: Text("Organization name"),
                        subtitle: Text(" Bill Type name"),

                        onTap: (){

                        },

                      )
                    ],
                  ),
                ),






                Container(

                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getWidth(10)),

                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),
                  child: Column(
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                        child: Row(
                          children: [
                            Text("Summery : ",
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      Table(

                        border: TableBorder.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow( children: [
                            Column(children:[Text('Account no :\n 123456789', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text('Account Name :\n ${widget.firstName}${widget.lastName}', style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]),

                          TableRow( children: [
                            Column(children:[Text('Due date : \n 01/02/2023', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text("Status : \n Unpaid", style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]),

                          TableRow( children: [
                            Column(children:[Text('Amount : ', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text("৳ 250", style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]),







                        ],
                      ),


                      SizedBox(height: 10,),


                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                      //   child: Row(
                      //     children: [
                      //       Text("PIN : ",
                      //         style: GoogleFonts.openSans(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 10,),

                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Container(
                      //     height: 50,width: 296,
                      //     decoration: BoxDecoration(
                      //         border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                      //         borderRadius: BorderRadius.circular(6.0),
                      //         color: Colors.white
                      //     ),
                      //
                      //
                      //
                      //     child: TextField(
                      //       //controller: _mobileNo,
                      //       keyboardType: TextInputType.number,
                      //       cursorColor: Colors.red.shade900,
                      //       decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         prefixIcon: Icon(Icons.lock,size: 30,color: Colors.red.shade900,),
                      //         hintText: 'Enter PIN',
                      //         hintStyle: TextStyle(color: Colors.grey.shade400),
                      //         suffixIcon: InkWell(
                      //             onTap:() {
                      //
                      //               // Navigator.push(
                      //               //   context,
                      //               //   MaterialPageRoute(
                      //               //     builder: (context) {
                      //               //       return MarchentPayConfirmation(
                      //               //         receiveNumb: receiverNumb,
                      //               //         totAmount: amount,
                      //               //         ref: _mobileNo.text.toString(),
                      //               //       );
                      //               //     },
                      //               //   ),
                      //               // );
                      //
                      //             },
                      //             child: Icon(Icons.arrow_forward,size: 30,color: Colors.red.shade900,)),
                      //         suffixIconColor: Color(0xFFFCDEDE),
                      //       ),
                      //     ),
                      //
                      //
                      //
                      //   ),
                      // ),




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


                InkWell(
                  onTapDown: (Detail) async {
                    //startRecording();
                    //controller.reset();
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
                      borderRadius: BorderRadius.all(
                          Radius.circular(70.0)), // Set rounded corner radius
                    ),

                    child: Text("Tap to Submit",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                  ),
                  onTapUp: (detail) {
                    controller.stop();

                    controller.reset();

                  },

                ),


                // GestureDetector(
                //   onTap: () async {
                //     //startRecording();
                //   },
                //   child: Container(
                //     padding: EdgeInsets.all(20),
                //     margin: EdgeInsets.all(20),
                //
                //     decoration: BoxDecoration(
                //       color: Colors.red.shade900,
                //       // border: Border.all(width: 3.0),   // Set border width
                //       borderRadius: BorderRadius.all(
                //           Radius.circular(65.0)), // Set rounded corner radius
                //       //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                //     ),
                //
                //     child: Text("Tap to\n Submit",
                //       style: GoogleFonts.openSans(
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