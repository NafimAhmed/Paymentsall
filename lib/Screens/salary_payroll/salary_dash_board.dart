


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/salary_payroll/salarypay_pin.dart';

import '../../utils/app_layout.dart';

class SalaryDashBoard extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            SizedBox(height: 30,),
            SafeArea(
              child: Row(
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                  Text('Salary Payroll',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                ],
              ),
            ),

            SizedBox(height: 40,),


            Container(
              decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Total Amount : "),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(" ৳ 100000",
                      style: GoogleFonts.openSans(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900
                      ),
                      ),


                      InkWell(
                        onTap: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SalaryPayPin();
                              },
                            ),
                          );

                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                        ),
                      )



                    ],
                  ),

                  Row(
                    children: [
                      Text("Aveilable Balance : ",
                        style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Text("100.00",

                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,

                        ),

                      ),
                      Text(" ৳",

                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),

                      ),

                      //Icon(Icons.currency_lira)



                    ],
                  ),



                ],
              ),
            ),




            Container(
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Employee name'),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Designation"),
                              Text("Salary amount"),

                            ],
                          ),

                        );

                      }
                  ),
                ],
              ),
            )




          ],
        ),
      ),
    );
  }

}