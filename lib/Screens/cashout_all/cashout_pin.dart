


import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'cashout_confirmation.dart';

class CashOutPin extends StatelessWidget
{
  final String receiverNumb,amount;

   CashOutPin({super.key, required this.receiverNumb, required this.amount});

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
                  Text('Cashout Confermation',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                ],
              ),
            ),

            SizedBox(height: 40,),


            Container(
              width: AppLayout.getScreenWidth(),
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                  color: Colors.red.shade100,
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
                color: Colors.red.shade100,
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
                        Column(children:[Text('৳ $amount', style: TextStyle(fontSize: 20.0))]),
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



                      child: TextField(
                        //controller: _mobileNo,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,size: 30,color: Colors.red.shade900,),
                          hintText: 'Enter PIN',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: InkWell(
                            onTap:() {
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

                            },
                              child: Icon(Icons.arrow_forward,size: 30,color: Colors.red.shade900,)),
                          suffixIconColor: Color(0xFFFCDEDE),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),








          ],
        ),
      ),
    );
  }

}