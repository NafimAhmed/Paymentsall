

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/cashout_all/cashout_pin.dart';

import '../../utils/app_layout.dart';

class CashoutAmount extends StatelessWidget
{

  final String agentNumber;
  final String pin;
  final String balance;


  CashoutAmount({super.key, required this.agentNumber, required this.pin, required this.balance});

  TextEditingController _amount=TextEditingController();




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Cash Out Amount',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),

        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 30,bottom: 16),
          child: Container(
            height: 500,width: 320,
            decoration: BoxDecoration(
                border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 40,),

                Container(
                  width: AppLayout.getScreenWidth()-65,
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Agent : ",
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text("${agentNumber}",
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                      ),
                      )

                    ],
                  ),
                ),






                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cashout Amount : ",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextField(
                        controller: _amount,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.red.shade900,
                        style: GoogleFonts.openSans(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade900
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Text(" ৳",
                            style: GoogleFonts.openSans(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,

                            ),
                          ),//Icon(Icons.currency_lira,size: 30,color: Colors.red.shade900,),
                          hintText: 'Amount',

                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: GestureDetector(

                            onTap: (){


                              if(_amount.text.toString().isNotEmpty){

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CashOutPin(
                                        receiverNumb: agentNumber,
                                        amount: _amount.text.toString(),
                                        pin: pin,
                                        balance: balance,
                                      );
                                    },
                                  ),
                                );

                              }
                              else
                                {
                                  Fluttertoast.showToast(
                                      msg: "Please enter your amount.Thank You! ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 10,
                                      backgroundColor: Colors.red.shade100,
                                      textColor: Colors.black,
                                      fontSize: 16.0
                                  );
                                }




                            },
                              child: Ink(child: Icon(Icons.arrow_forward_ios))
                          ),
                          suffixIconColor: Colors.red.shade300,
                        ),
                      ),

                      Row(
                        children: [
                          Text("Aveilable Balance : ",
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          Text("100.00",

                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,

                            ),

                          ),
                          Text(" ৳",

                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),

                          ),

                          //Icon(Icons.currency_lira)



                        ],
                      )
                    ],
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}