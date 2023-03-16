



import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class CashOutConfirmation extends StatefulWidget
{
  final String totalAmount,receiversNumber,senderPhoneNumber,balance;

  const CashOutConfirmation({super.key, required this.totalAmount, required this.receiversNumber, required this.senderPhoneNumber, required this.balance});

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

      cashout(widget.senderPhoneNumber, widget.receiversNumber, widget.totalAmount);
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

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Confirm CashOut',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),

        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 30,bottom: 16),
          child: Container(
            height: 600,width: 320,
            decoration: BoxDecoration(
                border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white
            ),
            child: Column(
              children: [

                SizedBox(height: 40,),

                Text("XYZ Telecom",
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),

                Text(widget.receiversNumber,
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
                    //







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





                ////////////////////////////////////////


              ],
            ),
          ),
        ),
      ),
    );
  }


  void cashout (String sendPhoneNumber,String receiverPhoneNumber,String amount)async{


    //FirebaseDatabase database = FirebaseDatabase.instance;

    DateTime now = DateTime.now();
    //String formattedDate = DateFormat.yMMMEd().format(now);
    String formettedtime=DateFormat('E,d MMM yyyy HH:mm:ss').format(now);
    //print(formattedDate);




    double amnt=double.parse(amount);
    ////////////////sender///////////////////////////////////////////////////////////////////////////////

    DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");


    final sendPhoneNumbersnapshotBalance = await rf.child(sendPhoneNumber).child("profile").child("balance").get();



    //////////////////sender//////////////////////////////////////////////////////////////////////////////////

    double senderBalance=double.parse(sendPhoneNumbersnapshotBalance.value.toString());

    ///////receiver///////////////////////////////////////////////////////////////////////////////


    final receiverPhoneNumbersnapshotBalance = await rf.child(receiverPhoneNumber).child("profile").child("balance").get();

    double receiverBalance=double.parse(receiverPhoneNumbersnapshotBalance.value.toString());
    double senderCurrentBalance=senderBalance-amnt;
    double receiverCurrentBalance=receiverBalance+amnt;


    //DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    await rf.child(receiverPhoneNumber).child("profile").update({
      "balance":receiverCurrentBalance.toString()
    }).then((value) async {

      await rf.child(sendPhoneNumber).child("profile").update({
        "balance":senderCurrentBalance.toString()
      }).then((value) {

        Fluttertoast.showToast(
            msg: "Cashout successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      });


    });


    // await rf.child(sendPhoneNumber).child("profile").update({
    //   "balance":senderCurrentBalance.toString()
    // });





    /////receiver/////////////////////////////////////////////////////////////////////////


    DatabaseReference senderPostRef = rf.child(sendPhoneNumber).child("transection").push();
    senderPostRef.set({
      // ...
      "type":"Cashout",
      "amount":"$amount",
      "time": formettedtime,
    });



    DatabaseReference receiverPostRef = rf.child(receiverPhoneNumber).child("transection").push();
    receiverPostRef.set({
      "type":"Cashout received",
      "amount":"$amount",
      "time":formettedtime,
    });

    // await rf.child(sendPhoneNumber).child("transection").set({
    //         "amount":"30",
    //       });






    bool isSennt=false;
    bool isReceived=false;


    // if (receiverPhoneNumbersnapshotBalance.exists){
    //
    //   double receiverBalance=double.parse(receiverPhoneNumbersnapshotBalance.value.toString());
    //   double senderCurrentBalance=senderBalance-amnt;
    //   double receiverCurrentBalance=receiverBalance+amnt;
    //
    //
    //
    //   await rf.child(sendPhoneNumber).child("profile").set({
    //     "balance":senderCurrentBalance.toString(),
    //   }).then((value)async {
    //
    //     await rf.child(sendPhoneNumber).child("Transition").child("path").set({
    //       "balance":amount,
    //       "type":"send"
    //     }).then((value) {
    //       isSennt=true;
    //     });
    //
    //   });
    //   //}
    //
    //
    //   //}
    //
    //
    //   await rf.child(receiverPhoneNumber).child("profile").update({
    //     "balance":receiverCurrentBalance.toString(),
    //   }).then((value) async{
    //     await rf.child(receiverPhoneNumber).child("Transition").set({
    //       "balance":amount,
    //       "type":"received"
    //     }).then((value) {
    //       isReceived=true;
    //     });
    //   });
    //   //}
    //
    // }
    // else{
    //   Fluttertoast.showToast(
    //       msg: "This account doesn't exist",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    // }
    //
    //
    //
    // if(isSennt && isReceived)
    //   {
    //
    //     Fluttertoast.showToast(
    //         msg: "Cashout Successful",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0
    //     );
    //
    //   }
    // else{
    //   Fluttertoast.showToast(
    //       msg: "Something wrong. please try again",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    // }
    //
    //
    //
    //
    //
    //
    //






  }






}