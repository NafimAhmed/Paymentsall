

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/app_layout.dart';

class DonateHome extends StatelessWidget
{
  TextEditingController donorName= TextEditingController();
  TextEditingController SenderPhoneNumber= TextEditingController();
  TextEditingController amount= TextEditingController();


  Query dref=FirebaseDatabase.instance.ref("Donation_Org");


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Donation"),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              SizedBox(height: 30,),
              Container(
                child: TextField(
                  controller: donorName,
                  maxLines: 1,
                  decoration: InputDecoration(

                      labelText: "Donor name",
                      labelStyle: GoogleFonts.raleway(

                      ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "Enter Donor Name",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.red.shade900,
                              width: 1.0
                          )
                      )
                  ),
                ),
              ),

              SizedBox(height: 30,),
              Container(
                child: TextField(
                  controller: SenderPhoneNumber,
                  maxLines: 1,
                  decoration: InputDecoration(


                      labelText: "Donor Phone Number",
                      labelStyle: GoogleFonts.raleway(

                      ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "Enter Donor Phone Number",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.red.shade900,
                              width: 1.0
                          )
                      )
                  ),
                ),
              ),


              SizedBox(height: 30,),
              Container(
                child: TextField(
                  controller: amount,
                  maxLines: 1,
                  decoration: InputDecoration(

                      labelText: "Donation Amount",
                      labelStyle: GoogleFonts.raleway(

                      ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "Enter Donation Amount",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.red.shade900,
                              width: 1.0
                          )
                      )
                  ),
                ),
              ),

              SizedBox(height: 40,),


              ElevatedButton(onPressed: (){

                Donation(
                    SenderPhoneNumber.text.toString(),
                  donorName.text.toString(),
                  amount.text.toString()
                );

              },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    child: Text("Donate",
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
              ),
                  ) )









            ],
          ),
        ),
      ),
    );
  }


  void Donation (String sendPhoneNumber,String donorName,String amount)async{


    //FirebaseDatabase database = FirebaseDatabase.instance;

    DateTime now = DateTime.now();
    //String formattedDate = DateFormat.yMMMEd().format(now);
    String formettedtime=DateFormat('E,d MMM yyyy HH:mm:ss').format(now);
    //print(formattedDate);




    double amnt=double.parse(amount);
    ////////////////sender///////////////////////////////////////////////////////////////////////////////

    DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");
    DatabaseReference donrf=FirebaseDatabase.instance.ref("Donation");


    final sendPhoneNumbersnapshotBalance = await rf.child(sendPhoneNumber).child("profile").child("balance").get();



    //////////////////sender//////////////////////////////////////////////////////////////////////////////////

    double senderBalance=double.parse(sendPhoneNumbersnapshotBalance.value.toString());

    ///////receiver///////////////////////////////////////////////////////////////////////////////


    final receiverPhoneNumbersnapshotBalance = await donrf.child("Balance").get();

    double receiverBalance=double.parse(receiverPhoneNumbersnapshotBalance.value.toString());
    double senderCurrentBalance=senderBalance-amnt;
    double receiverCurrentBalance=receiverBalance+amnt;


    //DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    await donrf.update({
      "Balance":receiverCurrentBalance.toString()
    }).then((value) async {

      await rf.child(sendPhoneNumber).child("profile").update({
        "balance":senderCurrentBalance.toString()
      }).then((value) {

        // Fluttertoast.showToast(
        //     msg: "Cashout successful",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );

      });


    });




    DatabaseReference senderPostRef = rf.child(sendPhoneNumber).child("transection").push();
    senderPostRef.set({
      // ...
      "transection_type":"Sent",
      "opponent": "$donorName",
      "type":"Donation",
      "amount":amount,
      "time": formettedtime,
    });


    DatabaseReference senderPostNotifyRef = rf.child(sendPhoneNumber).child("Notifications").push();
    senderPostNotifyRef.set({
      // ...
      "transection_type":"Sent",
      "opponent":"$donorName",
      "type":"Donation",
      "amount":amount,
      "time": formettedtime,
    });





    DatabaseReference receiverPostRef = donrf.child("Donation_History").child(senderPostRef.key.toString());
    receiverPostRef.set({
      "transection_type":"Received",
      "opponent":sendPhoneNumber,
      "type":"Donation",
      "amount":amount,
      "time":formettedtime,
      "DonorName":"$donorName"
    });

    // DatabaseReference receiverPostNotifyRef = rf.child(receiverPhoneNumber).child("Notifications").child(senderPostRef.key.toString());
    // receiverPostNotifyRef.set({
    //   "transection_type":"Received",
    //   "opponent":sendPhoneNumber,
    //   "type":"Cash out",
    //   "amount":amount,
    //   "time":formettedtime,
    // });











  }






}