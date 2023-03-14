import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:payments_all_app/Screens/Home/HomePage.dart';

import '../../../../utils/app_layout.dart';
import '../../../MainScreen.dart';

class LoanSuccessfulPage extends StatelessWidget {
  final String amount;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String pin;
   LoanSuccessfulPage({super.key, required this.amount, required this.firstName, required this.lastName, required this.phoneNumber, required this.pin});


  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: AppLayout.getScreenHeight(),width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Your Loan has been Successful',
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                    ),
                    Icon(Icons.check_circle_outline ,color: CupertinoColors.systemGreen,size: 40,)
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle,size: 60,color: Colors.grey.shade200,),
                title: Text('$firstName$lastName'),
                subtitle: Text(phoneNumber),
              ),
              Divider(color:  Color(0xFFFFF8F8),thickness: 5,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: AppLayout.getHeight(40),width: AppLayout.getWidth(320),
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Time',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),
                            ),
                            Text('${DateFormat.jm().format(now).toString()} ${DateFormat.yMd().format(now).toString()} ',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                //fontSize: 16
                              ),
                            ),

                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Transaction ID',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),
                            ),
                            Text('7148JIS7YC',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                //fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color:  Color(0xFFFFF8F8),thickness: 5,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: AppLayout.getHeight(70),width: AppLayout.getWidth(320),
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Received Amount',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),
                            ),
                            Text('৳$amount.00',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                //fontSize: 16
                              ),
                            ),
                            Text('৳$amount.00-৳69.00',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('New Balance',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),
                            ),
                            Text('৳5,960.53',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                //fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color:  Color(0xFFFFF8F8),thickness: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: AppLayout.getHeight(60),width: AppLayout.getWidth(320),
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Took a E-Loan',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),),
                            Text('৳$amount.00', style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              //fontSize: 16
                            ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Giving E-Loan',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),
                            ),
                            Image.asset('assets/images/Payments_All_Logo.png',height: 30,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color:  Color(0xFFFFF8F8),thickness: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: AppLayout.getHeight(70),width: AppLayout.getWidth(320),
                  child: Container(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Payable',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            //fontSize: 16
                          ),),
                        Text('৳3050.90',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            //fontSize: 16
                          ),),
                        Text('৳$amount.00+৳50.90',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            //fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Container(
                    height: 40,width: 100,
                    child: TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return MainScreen();
                        //     },
                        //   ),
                        // );
                        // Navigator.of(context).pop();

                      },
                      child: Text('Done!',
                        style: GoogleFonts.openSans(
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.w300,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
