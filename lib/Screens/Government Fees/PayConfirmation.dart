import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ConfirmPaymentPage.dart';

class PayConfirmationPage extends StatefulWidget {
  final String accountNumber,accountName,amount,pin;
  const PayConfirmationPage({super.key, required this.accountNumber, required this.accountName, required this.amount, required this.pin});

  @override
  State<PayConfirmationPage> createState() => _PayConfirmationPageState();
}

class _PayConfirmationPageState extends State<PayConfirmationPage> {


// class PayConfirmationPage extends StatelessWidget {
//
//
//
//   final String accountNumber,accountName,amount,pin;
//    PayConfirmationPage({super.key, required this.accountNumber, required this.accountName, required this.amount, required this.pin});
//


   bool _obscureText = true;



  final TextEditingController _pinG = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
          backgroundColor: Color(0xFFFFF8F8)

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Container(
                  height: 90,
                  width: 330,
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/images/ait.png',height: 30,)),
                    title: Text('Land Development(LD) Tax'),
                    subtitle: Text('Govt. Fees'),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  child: Table(
                    border: TableBorder.all(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1),

                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        children: [
                          Column(children:[Text('Account Number \n ${widget.accountNumber}', style: GoogleFonts.openSans(fontSize: 16.0))]),
                          Column(children:[Text('Account Name \n ${widget.accountName}', style: GoogleFonts.openSans(fontSize: 16.0))]),
                        ]
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 150,
                  width: 330,
                  child: Table(
                    border: TableBorder.all(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1),

                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          children: [
                        Column(children:[Text('Amount\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                        Column(children:[Text('Charge\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                        Column(children:[Text('Total\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                      ]),
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          children: [
                        Column(children:[Text('৳ ${widget.amount}.00', style: TextStyle(fontSize: 16.0))]),
                        Column(children:[Text('+৳ 0.00', style: TextStyle(fontSize: 16.0))]),
                        Column(children:[Text('৳ ${widget.amount}.00', style: TextStyle(fontSize: 16.0))]),
                      ]),

                    ],
                  ),

                ),

                SizedBox(height: 20,),
                // Text('   PIN',style: GoogleFonts.openSans(
                //   fontSize: 16,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w400
                // ),),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,width: 330,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white
                    ),



                    child: GestureDetector(
                      child: TextField(
                        controller: _pinG,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,size: 20,color: Colors.red.shade300,),
                          hintText: 'Enter PIN',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: InkWell(
                              onTap:() {
                                if(_pinG.text.isNotEmpty && _pinG.text.toString()==widget.pin){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ConfirmPaymentPage(
                                          accountNumber: widget.accountNumber.toString(),
                                          accountName: widget.accountName.toString(),
                                          amount: widget.amount.toString(),
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
                              child: Icon(Icons.arrow_forward,size: 22,color: Colors.red.shade300,)),
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
        ),
      ),
    );
  }
}
