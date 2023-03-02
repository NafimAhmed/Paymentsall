


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


        appBar: AppBar(

          backgroundColor: const Color(0xFFFFF8F8),
          elevation: 0.0,

          title: const Text("Contact us",
            style: TextStyle(
                color: Colors.black
            ),
          ),

          iconTheme: const IconThemeData(
              color: Colors.black),
        ),

        backgroundColor: const Color(0xFFFFF8F8),



        body: SingleChildScrollView(
          child: Column(
          children: [


            Center(
              child: Image.asset("assets/images/contact.png",

                height: AppLayout.getScreenHeight()/3,
                width: AppLayout.getScreenWidth(),


              ),
            ),



            const SizedBox(height: 60,),





            InkWell(
                onTap: (){
                  //launch("tel://21213123123");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Icon(Icons.location_on,
                      size: 60,
                      color: Colors.red.shade900,
                    ),

                    Text("Address :\nMAG House, House# 20, Shah Makhdum Avenue, Sector#11, Uttara, Dhaka-1230, Bangladesh.",
                      textAlign: TextAlign.center,

                      style: GoogleFonts.openSans(
                        fontSize: 20,

                      ),
                    ),
                  ],
                )),
            SizedBox(height: AppLayout.getHeight(40),),






            InkWell(
              onTap: (){
                launch("tel://21213123123");
              },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Icon(Icons.phone_android,
                      size: 60,
                      color: Colors.red.shade900,
                    ),

                    const SizedBox(height: 20,),

                    Text("Contact us :\n+8801797609439",
                      textAlign: TextAlign.center,

                      style: GoogleFonts.openSans(
                        fontSize: 20,

                      ),
                    ),
                  ],
                )),
            SizedBox(height: AppLayout.getHeight(40),),


            InkWell(
              onTap: () async {
                String email="recentnafimahmed@gmail.com";
                String subject="Support payments all";
                String body="";

                Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                await launchUrl(mail);


              },
              child: Column(
                children: [

                  Icon(Icons.email,
                    size: 60,
                    color: Colors.red.shade900,
                  ),

                  const SizedBox(height: 20,),

                  Text("Email :\nrecentnafimahmed@gmail.com",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                    ),

                  ),
                ],
              ),
            ),


            const SizedBox(height: 100,)




          ],
      ),
        )
    );
  }

}