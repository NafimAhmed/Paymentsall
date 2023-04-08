




import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_layout.dart';
import 'TransferReceiptScreen.dart';



class SendMoneyConfirmationPage extends StatefulWidget{


  final String contacts,name,amount,SenderPhoneNumber,ref,pin;
  const SendMoneyConfirmationPage({super.key,required this.SenderPhoneNumber ,required this.contacts, required this.name, required this.amount, required this.ref, required this.pin, });

  @override
  State<SendMoneyConfirmationPage> createState() => _SendMoneyConfirmationPageState();
}

class _SendMoneyConfirmationPageState extends State<SendMoneyConfirmationPage>with TickerProviderStateMixin {

  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=.99){

      controller.stop();

      Fluttertoast.showToast(
          msg: "Done Transaction",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      SendMoney(widget.SenderPhoneNumber, widget.contacts, widget.amount);

    }
    setState(() {

    });
  });
  // bool determinate = false;



  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }


///////////////////////////////////////////////////////









  @override
  Widget build(BuildContext context) {




    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Send Money Confirmation',style: TextStyle(color: Colors.black)),
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

                Text("XYZ Store",
                  style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(widget.contacts,
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
                        Column(children:[Text('Total :\n ৳ ${widget.amount}', style: GoogleFonts.openSans(fontSize: 20.0))]),
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
                    //controller.reset();
                    controller.repeat();

                    if(controller.value>=1){

                      controller.stop();

                    }


                  },
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TransferReceiptPage(recNumb: widget.contacts,
                            SenderPhoneNumber: widget.SenderPhoneNumber,
                            recName: widget.name,
                            recAmount: widget.amount,
                            pin: '',);

                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(40),
                    margin: EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.all(
                          Radius.circular(70.0)), // Set rounded corner radius
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

                    controller.reset();

                  },

                ),




              ],
            ),
          ),
        ),
      ),
    );
  }



  void SendMoney (String sendPhoneNumber,String receiverPhoneNumber,String amount)async{


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
      "transection_type":"Sent",
      "opponent":receiverPhoneNumber,
      "type":"Send money",
      "amount":amount,
      "time": formettedtime,
    });


    DatabaseReference senderPostNotifyRef = rf.child(sendPhoneNumber).child("Notifications").push();
    senderPostNotifyRef.set({
      // ...
      "transection_type":"Sent",
      "opponent":receiverPhoneNumber,
      "type":"Send money",
      "amount":amount,
      "time": formettedtime,
    });





    DatabaseReference receiverPostRef = rf.child(receiverPhoneNumber).child("transection").child(senderPostRef.key.toString());
    receiverPostRef.set({
      "transection_type":"Received",
      "opponent":sendPhoneNumber,
      "type":"Send money",
      "amount":amount,
      "time":formettedtime,
    });

    DatabaseReference receiverPostNotifyRef = rf.child(receiverPhoneNumber).child("Notifications").child(senderPostRef.key.toString());
    receiverPostNotifyRef.set({
      "transection_type":"Received",
      "opponent":sendPhoneNumber,
      "type":"Send money",
      "amount":amount,
      "time":formettedtime,
    });







    bool isSennt=false;
    bool isReceived=false;





  }







}