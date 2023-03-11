import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'RepayMoneyDuration.dart';

class EloanPageTwo extends StatelessWidget {
  const EloanPageTwo({Key? key}) : super(key: key);

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

        child: Container(
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white
          ),

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),

              Image.asset('assets/images/Payments_All_Logo.png',height: 100,width: 200,),

              SizedBox(height: 30,),

              Text('Dear User, your useable E_loan Limit is',
                 style: GoogleFonts.openSans(
                     color: Colors.black,
                     fontWeight: FontWeight.w400,
                     fontSize: 20
                 ),
                 textAlign: TextAlign.center,


               ),

              SizedBox(height: 20,),

              Text('৳10,000',

                 style: GoogleFonts.openSans(
                     color: Colors.red.shade900,
                     fontWeight: FontWeight.w500,
                     fontSize: 32
                 ),
                 textAlign: TextAlign.center,

               ),


              SizedBox(height: 274,),
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
                          return RepayMoneyDurationAndAmount();
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
      ),
    );
  }
}
