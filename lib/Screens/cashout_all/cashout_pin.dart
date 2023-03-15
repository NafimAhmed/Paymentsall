


import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'cashout_confirmation.dart';

// class CashOutPin extends StatefulWidget {
//
//   final String receiverNumb,amount,senderPhoneNumber;
//
//   final String pin;
//   final String balance;
//
//   const CashOutPin({super.key, required this.receiverNumb, required this.amount, required this.pin, required this.balance, required this.senderPhoneNumber});
//
//   @override
//   State<CashOutPin> createState() => _CashOutPinState();
// }

class CashOutPin extends StatelessWidget {

  final String receiverNumb,amount,senderPhoneNumber;

  final String pin;
  final String balance;

   CashOutPin({super.key, required this.receiverNumb, required this.amount, required this.pin, required this.balance, required this.senderPhoneNumber});


  bool _obscureText = true;

// class CashOutPin extends StatelessWidget
// {
//   final String receiverNumb,amount;
//   final String pin;
//   final String balance;
//
//    CashOutPin({super.key, required this.receiverNumb, required this.amount, required this.pin, required this.balance});

  String charge="10";
  
  String total(String amount,String charge){

    double amt= double.parse(amount);
    double chr=double.parse(cha(amount,charge));
    
    return (amt+chr).toString();
    
  }


  String cha(String amount,String chrg){
    double amt= double.parse(amount);
    double chr=double.parse(chrg);


    return ((chr*amt)/1000).toString();
  }


  TextEditingController _pinC=TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('CashOut Confirmation',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),

        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 16,bottom: 16),
          child: Container(
            height: 500,width: 320,
            decoration: BoxDecoration(
                border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white
            ),
            child: Column(

              children: [
                SizedBox(height: 50,),


                Container(


                  width: AppLayout.getScreenWidth(),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(1)),

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

                      Text(receiverNumb,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                        ),
                      )

                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),

                  child: Column(
                    children: [
                      Table(
                        children: [
                          TableRow( children: [
                            Column(children:[Text('Amount\n', style: GoogleFonts.openSans(fontSize: 20.0))]),
                            Column(children:[Text('Charge\n', style: GoogleFonts.openSans(fontSize: 20.0))]),
                            Column(children:[Text('Total\n', style: GoogleFonts.openSans(fontSize: 20.0))]),
                          ]),
                          TableRow( children: [
                            Column(children:[Text('৳ ${amount}', style: TextStyle(fontSize: 20.0))]),
                            Column(children:[Text('+৳ ${cha(amount, charge)}', style: TextStyle(fontSize: 20.0))]),
                            Column(children:[Text('৳ ${total(amount, charge)}', style: TextStyle(fontSize: 20.0))]),
                          ]),

                        ],
                      ),

                      SizedBox(height: AppLayout.getHeight(25),),


                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                        child: Row(
                          children: [
                            Text("PIN : ",
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,width: 296,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),



                          child: GestureDetector(
                            child: TextField(
                              controller: _pinC,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red.shade900,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock,size: 30,color: Colors.red.shade900,),
                                hintText: 'Enter PIN',
                                hintStyle: TextStyle(color: Colors.grey.shade400),
                                suffixIcon: InkWell(
                                  onTap:() {

                                    if(_pinC.text.isNotEmpty && _pinC.text.toString()==pin){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return CashOutConfirmation(
                                              receiversNumbe: receiverNumb,
                                              totalAmount: total(amount, charge),
                                            );
                                          },
                                        ),
                                      );

                                    }
                                    else
                                    {
                                      Fluttertoast.showToast(
                                          msg: "Please enter your PIN correctly.Thank You! ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 10,
                                          backgroundColor: Colors.red.shade100,
                                          textColor: Colors.black,
                                          fontSize: 16.0
                                      );
                                    }

                                  },
                                    child: Icon(Icons.arrow_forward,size: 30,color: Colors.red.shade900,)),
                                suffixIconColor: Color(0xFFFCDEDE),
                              ),
                            ),
                            // onTap: (){
                            //   // setState(() {
                            //   //   _obscureText = !_obscureText;
                            //   // });
                            // },
                          ),

                        ),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}