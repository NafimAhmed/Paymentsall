import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'E-loanPage2.dart';

class EloanPage extends StatefulWidget {
  final String amount;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String pin;

  const EloanPage({super.key, required this.amount, required this.firstName, required this.lastName, required this.phoneNumber, required this.pin});

  @override
  State<EloanPage> createState() => _EloanPageState();
}

class _EloanPageState extends State<EloanPage> {
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFF8F8),
          title: Row(
          children: [
            Text('E-Loan',style: TextStyle(color: Colors.black)),
            Spacer(),
            TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: const Icon(
                              Icons.hexagon,color: Color(0xFFE57373),
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: const Icon(
                              Icons.star,color: Colors.white,size: 14,
                            ),

                          ),
                        ),

                      ],
                    ),
                    Text('0 Points',style: TextStyle(color: Colors.red.shade900)),
                  ],
                ))
          ],
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),

      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: Padding(

        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 450,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.asset('assets/images/Payments_All_Logo.png',height: 100,width: 200,),

                  Text('Take a Loan to your own Payments All Account',
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24
                    ),
                    textAlign: TextAlign.center,

                  ),
                  SizedBox(height: 10,),
                  Divider(thickness: 4,color: Colors.red.shade50,),
                  Text('Dear User, you can take a maximum amount of taka',
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,

                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),

                  Text('৳10,000',
                      style: GoogleFonts.openSans(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.w600,
                      fontSize: 30
                  ),
                    textAlign: TextAlign.center,

                  ),
                  SizedBox(height: 10,),

                  Text('According to your Payments All accounts status, you can get different loan limit.',
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 18
                    ),
                    textAlign: TextAlign.center,

                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.red.shade900,
                          activeColor: Colors.white,
                          value: value,
                          onChanged: (bool? val){
                            setState(() {
                              value=val!;
                            });
                          }),

                      Text('For the E-Loan processing, I am \ngiving permission to access my \ninformation.',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                        //textAlign: TextAlign.center,

                      ),
                      SizedBox(height: 10,),

                    ],
                  )



                ],
              ),
            ),
            SizedBox(height: 125,),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.red.shade900
              ),
              child: TextButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EloanPageTwo(
                          amount: widget.amount,
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          phoneNumber: widget.phoneNumber,
                          pin: widget.pin
                        );
                      },
                    ),
                  );

                },
                child: Row(
                  children: [
                    Text('Next',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                    Spacer(),
                    Icon(Icons.arrow_forward,color: Colors.white,)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
