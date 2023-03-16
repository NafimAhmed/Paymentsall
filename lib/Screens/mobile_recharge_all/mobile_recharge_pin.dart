


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/mobile_recharge_all/mobile_recharge_confirmation.dart';

import '../../utils/app_layout.dart';

class MobileRechargePin extends StatefulWidget {
  final String recNumb,amount,connectionType,operator,pin,balance;
  const MobileRechargePin({super.key, required this.recNumb, required this.amount, required this.connectionType, required this.operator, required this.pin, required this.balance});

  @override
  State<MobileRechargePin> createState() => _MobileRechargePinState();
}

class _MobileRechargePinState extends State<MobileRechargePin> {


  //const MobileRechargePin({super.key, required this.recNumb, required this.amount,required this.connectionType});
  final TextEditingController _pinMR =TextEditingController();
  bool _obscureText = true;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Mobile Recharge Confirm',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),



      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 400,width: 320,
          decoration: BoxDecoration(
              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  //SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                    decoration: BoxDecoration(
                        color: Colors.red.shade50,
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
                            Text(widget.recNumb,
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
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),

                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow( children: [
                              Column(children:[Text('Amount\n', style: GoogleFonts.openSans(fontSize: 18.0))]),
                              Column(children:[Text('Charge\n', style: GoogleFonts.openSans(fontSize: 18.0))]),
                              Column(children:[Text('Total\n', style: GoogleFonts.openSans(fontSize: 18.0))]),
                            ]),
                            TableRow( children: [
                              Column(children:[Text('৳ ${widget.amount}', style: TextStyle(fontSize: 16.0))]),
                              Column(children:[Text('+৳ 0.00', style: TextStyle(fontSize: 16.0))]),
                              Column(children:[Text('৳ ${widget.amount}', style: TextStyle(fontSize: 16.0))]),
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
                                controller: _pinMR,
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
                                        if(_pinMR.text.isNotEmpty && _pinMR.text.toString()==widget.pin){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return MobileRechargeConfirmation(
                                                    amount: widget.amount.toString(),
                                                    connectiontype: widget.connectionType.toString(),
                                                    oprerator: widget.operator.toString(),
                                                    number: widget.recNumb);
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
                              onTap: (){
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
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
      ),
    );
  }

}