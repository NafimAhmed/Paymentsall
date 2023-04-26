


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_layout.dart';
import 'collection_point.dart';

class Endowsement extends StatelessWidget
{

  final String phoneNumber;


  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");

   Endowsement({super.key, required this.phoneNumber});



  FirebaseDatabase database_Endowsment = FirebaseDatabase.instance;

  DatabaseReference rf_Endowsment = FirebaseDatabase.instance.ref("Endowsment_Rate");




  @override
  Widget build(BuildContext context) {

    String balance="0.00";
    String Endowse_rate="0.00";


    RxString? balancechange=balance.obs;
    RxString? Endowse_ratechange=Endowse_rate.obs;

    rf.child(phoneNumber).child('profile').onValue.listen((event) {

      double balan= double.parse(event.snapshot.child("balance").value.toString()!);

      balancechange.value=balan.toStringAsFixed(2);

    });


    rf_Endowsment.onValue.listen((event) {

      double rate= double.parse(event.snapshot.child("Doller").value.toString()!);

      Endowse_ratechange.value=rate.toStringAsFixed(2);

    });




    // TODO: implement build
    return Obx(() => Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back,color: Colors.black,)),
                const Text('Endowsement',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),




            Container(

              width: AppLayout.getScreenWidth(),
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),

              decoration: BoxDecoration(

                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(15)
              ),
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),

              child: Column(
                children: [
                  Text("Your current balance :",

                    style: GoogleFonts.openSans(
                        fontSize: 20
                    ),

                  ),

                  Gap(10),


                  Text("৳ ${balancechange.value}",
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
            ),


            Gap(10),




            Container(


              width: AppLayout.getScreenWidth(),
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),

              decoration: BoxDecoration(

                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(15)
              ),
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),



              child: Column(
                children: [
                  Text("Current exchange rate :",

                    style: GoogleFonts.openSans(
                        fontSize: 20
                    ),
                  ),
                  Text("\$ 1 = ৳ ${Endowse_ratechange}",
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade900,
                    ),

                  ),
                ],
              ),
            ),






            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Endowse Amount : ",
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextField(
                    // controller: rechargeAmount,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red.shade900,
                    style: GoogleFonts.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Text(" \$",
                        style: GoogleFonts.openSans(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color:  Colors.red.shade900

                        ),
                      ),//Icon(Icons.currency_lira,size: 30,color: Colors.red.shade900,),
                      hintText: 'Amount',

                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      suffixIcon: GestureDetector(

                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Collection_point();
                                },
                              ),
                            );


                          },
                          child: Ink(child: Icon(Icons.arrow_forward_ios))
                      ),
                      suffixIconColor: Colors.red.shade900,
                    ),
                  ),


                ],
              ),

            ),












          ],
        ),
      ),
    ));
  }
}