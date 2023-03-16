


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_layout.dart';
import 'collection_point.dart';

class Endowsement extends StatelessWidget
{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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


                  Text("৳ 500",
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
                  Text("\$ 1 = ৳ 100",
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
    );
  }
}