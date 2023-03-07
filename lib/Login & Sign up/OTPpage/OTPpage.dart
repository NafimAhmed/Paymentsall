import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../signUp/SignUpPage.dart';

class OTPsendPage extends StatefulWidget {
  const OTPsendPage({Key? key}) : super(key: key);

  @override
  State<OTPsendPage> createState() => _OTPsendPageState();
}

class _OTPsendPageState extends State<OTPsendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/Payments_All_Logo.png',height: 150,width: 250,),
             SizedBox(height: 20,),

            Text('WELCOME to',style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 26
            ),),

            Text('Payments All Business Dashboard',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),

            Text('Payments All Merchant/ Personal Portal Account',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            ),
            SizedBox(height: 20,),

            Text('Active Crush Account',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            ),
            SizedBox(height: 20,),

            Text('Enter OTP that has been sent to you',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 18
              ),
            ),

            SizedBox(height: 10,),

            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFFE57373),
              focusedBorderColor: Color(0xFFE57373),
              cursorColor: Colors.red.shade900,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    }
                );
              }, // end onSubmit
            ),
            SizedBox(height: 40,),


            Container(
              height: 40,width: 200,
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
                        return SignUpPage();
                      },
                    ),
                  );

                },
                child: Text('Proceed',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
