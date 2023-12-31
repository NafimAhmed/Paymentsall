

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'marchentpay_confirmation.dart';


class MerchantPayPin extends StatefulWidget {
  final String receiverNumb;
  final String senderNumber;
  final String amount;

  final String pin;
  final String balance;

  MerchantPayPin({super.key, required this.receiverNumb, required this.amount, required this.pin, required this.balance, required this.senderNumber});


  @override
  State<MerchantPayPin> createState() => _MerchantPayPinState();
}

class _MerchantPayPinState extends State<MerchantPayPin> {


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

  TextEditingController _reference=TextEditingController();
  TextEditingController _pin=TextEditingController();

  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Merchant Pay Confirmation',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),

        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 16,bottom: 16),
          child: Container(
            height: AppLayout.getHeight(600),width: 320,
            decoration: BoxDecoration(
                border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),

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
                      Text("Receiver : ",
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text(widget.receiverNumb,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                        ),
                      )


                    ],
                  ),
                ),





                SizedBox(height: 20,),



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
                            Column(children:[Text("৳${widget.amount}", style: TextStyle(fontSize: 20.0))]),
                            Column(children:[Text('+৳${cha(widget.amount, charge)}', style: TextStyle(fontSize: 20.0))]),
                            Column(children:[Text('৳ ${total(widget.amount, charge)}', style: TextStyle(fontSize: 20.0))]),
                          ]),

                        ],
                      ),

                      SizedBox(height: AppLayout.getHeight(25),),


                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                        child: Row(
                          children: [
                            Text("Reference : ",
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
                            controller: _reference,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.edit_note,size: 30,color: Colors.red.shade900,),
                              hintText: 'Enter Reference',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              suffixIconColor: Color(0xFFFCDEDE),
                            ),
                          ),
                        ),
                      ),



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
                              controller: _pin,
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

                                      if(_pin.text.isNotEmpty && _pin.text.toString()==widget.pin){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return MarchentPayConfirmation(
                                                receiveNumb: widget.receiverNumb,
                                                ref: _reference.text.toString(),
                                                totalAmount:  total(widget.amount, charge),
                                                balance: (double.parse(widget.balance)-double.parse(total(widget.amount, charge))).toString(),
                                                senderNumber: widget.senderNumber,
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
    );
  }

}