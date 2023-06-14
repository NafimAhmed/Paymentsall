

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeDetail extends StatelessWidget
{

  final String EmpName,UserPhone,EmpPhone,EmpSal,EmpDesig;



  TextEditingController EmpPhoneNumber=TextEditingController();

  TextEditingController EmpSalary=TextEditingController();
  TextEditingController EmpDesignation=TextEditingController();

   EmployeeDetail({super.key, required this.EmpName, required this.EmpPhone,required this.UserPhone, required this.EmpSal, required this.EmpDesig});




  //TextEditingController EmpSalary=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //Query dbref=FirebaseDatabase.instance.ref("User_profile").child("${UserPhone}").child("Employee_List").child("$EmpPhone");



    return Scaffold(
      appBar: AppBar(
        title: Text("Employee detail"),
      ),
      body: SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(height: 30,),
              Text("Employee name : $EmpName",

                style: GoogleFonts.openSans(
                    fontSize: 20
                ),
              ),

              SizedBox(height: 30,),

              Text("Employee designation : ",
                style: GoogleFonts.openSans(
                    fontSize: 18
                ),
              ),
              SizedBox(height: 10,),

              Container(
                child: TextField(

                  controller: EmpDesignation,


                  maxLines: 1,
                  decoration: InputDecoration(
                    // labelText: "Phone Number",
                    // labelStyle: GoogleFonts.raleway(
                    //
                    // ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "$EmpDesig",
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

              SizedBox(height: 30,),

              Text("Phone Number : ",
                style: GoogleFonts.openSans(
                    fontSize: 18
                ),
              ),
              SizedBox(height: 10,),

              Container(
                child: TextField(

                  controller: EmpPhoneNumber,


                  maxLines: 1,
                  decoration: InputDecoration(
                      // labelText: "Phone Number",
                      // labelStyle: GoogleFonts.raleway(
                      //
                      // ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "$EmpPhone",
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
              SizedBox(height: 30,),

              Text("Salary : ",
                style: GoogleFonts.openSans(
                  fontSize: 18
                ),
              ),

              SizedBox(height: 10,),

              Container(
                child: TextField(

                  controller: EmpSalary,


                  maxLines: 1,
                  decoration: InputDecoration(
                    // labelText: "Phone Number",
                    // labelStyle: GoogleFonts.raleway(
                    //
                    // ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "$EmpSal",
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
              SizedBox(height: 30,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ElevatedButton(
                    onPressed: (){

                      FirebaseDatabase.instance
                          .ref("User_profile")
                          .child("${UserPhone}")
                          .child("Employee_List")
                          .child("$EmpPhone")
                          .remove().then((value) => Navigator.pop(context)).onError((error, stackTrace) => null);

                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text("Delete Employee",
                          style: GoogleFonts.openSans(
                            fontSize: 15,

                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900 ,
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.red.shade900, width: 2),
                    ),

                  ),
                ],
              )




            ],
          ),
        ),
      ),
    );
  }


  void Delete(){

  }

}