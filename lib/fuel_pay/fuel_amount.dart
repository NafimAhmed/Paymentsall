

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FuelAmount extends StatelessWidget
{
  final String fuel_name;

   FuelAmount({super.key, required this.fuel_name});
  String Endowse_rate="0.00";


  //FirebaseDatabase database_Endowsment = FirebaseDatabase.instance;

  DatabaseReference rf_Endowsment = FirebaseDatabase.instance.ref("Fuel");





  @override
  Widget build(BuildContext context) {


    RxString? Endowse_ratechange=Endowse_rate.obs;


    rf_Endowsment.child("$fuel_name").onValue.listen((event) {

      double rate= double.parse(event.snapshot.child("Fuel_Price").value.toString()!);

      Endowse_ratechange.value=rate.toStringAsFixed(2);

    });




    // TODO: implement build
    return  Scaffold(

      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Fuel Amount',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),


      body: Container(

        margin: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          children: [

            Container(
              alignment: Alignment.center,
              height: 10.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.red.shade100
              ),
              child: Text("$fuel_name",
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),

              ),
            ),



            Container(
              alignment: Alignment.center,
              height: 10.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.red.shade100
              ),
              child: Obx(()=> Text("Price per Litre : ${Endowse_ratechange.value} ৳",
                style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),

              ),)

            ),


            SizedBox(height: 10.sp,),



            Container(
                alignment: Alignment.center,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.red.shade100
                ),
                child: Column(
                  children: [
                    Text("Quantity (in Litre) : "),

                    Container(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: TextField(
                        //controller: _mobileNumber,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(

                            prefixIcon: Icon(Icons.scale,
                              size: 30,
                              color: Colors.grey,),

                            // suffixIcon: Icon(Icons.contact_phone_outlined),
                            // suffixIconColor: Color(0xFFFCDEDE),


                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                            ),

                            hintText: "Fuel amount in litre",

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.red.shade900,
                                    width: 1.0
                                )
                            )
                        ),
                      ),
                    ),

                  ],
                )
            ),


            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.red.shade100
                ),

                child: Text("Total price : ")



            )

          ],
        ),
      ),
    );

  }

}