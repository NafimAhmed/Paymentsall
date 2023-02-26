


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_layout.dart';

class MobileRechargePin extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                Text('Recharge Confirmation',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),

            decoration: BoxDecoration(

                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Text("Phone Number : ",
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                  ),

                ),

                Gap(15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("01XXXXXXXXXXXXX",
                      style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
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
                      Column(children:[Text('৳ 250', style: TextStyle(fontSize: 20.0))]),
                      Column(children:[Text('+৳ 10', style: TextStyle(fontSize: 20.0))]),
                      Column(children:[Text('৳ 260', style: TextStyle(fontSize: 20.0))]),
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return CashOutConfirmation(
                              //         receiversNumbe: receiverNumb,
                              //         totalAmount: total(amount, charge),
                              //       );
                              //     },
                              //   ),
                              // );

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
    );
  }

}