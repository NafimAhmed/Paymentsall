


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmployee extends StatelessWidget
{

  final String PhoneNumber;

   AddEmployee({super.key, required this.PhoneNumber});

  TextEditingController EmpName = TextEditingController();
  TextEditingController EmpDesignetion = TextEditingController();
  TextEditingController EmpSalary = TextEditingController();
  TextEditingController EmpPhoneNumber = TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Add Employee',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.red.shade100,
        elevation: 0.0,
      ),


      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [



              Container(
                child: TextField(

                  controller: EmpName,


                  maxLines: 1,
                    decoration: InputDecoration(
                        labelText: "Employee name",
                        labelStyle: GoogleFonts.raleway(

                        ),
                        floatingLabelStyle: GoogleFonts.raleway(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade900,

                        ),
                        border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(30)
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        hintText: "Employee name",
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
              Container(
                child: TextField(
                  controller: EmpDesignetion,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Employee Designation",
                      labelStyle: GoogleFonts.raleway(

                      ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "Employee Designetion",
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
              Container(
                child: TextField(
                  controller: EmpSalary,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Employee Salary",
                      labelStyle: GoogleFonts.raleway(

                      ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "Employee Salary",
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

              Container(
                child: TextField(

                  controller: EmpPhoneNumber,


                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: GoogleFonts.raleway(

                      ),
                      floatingLabelStyle: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,

                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: "Employee Phone Number",
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

              ElevatedButton(
                onPressed: () {

                  DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");

                  DatabaseReference receiverPostRef = rf.child(PhoneNumber).child("Employee_List").child(EmpPhoneNumber.text.toString());
                  receiverPostRef.set({
                    "EmployeeName":EmpName.text.toString(),
                    "EmployeeDesignetion":EmpDesignetion.text.toString(),
                    "EmployeePhoneNumber":EmpPhoneNumber.text.toString(),
                    "EmployeeSalary":EmpSalary.text.toString(),
                  });


                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 15.0),
                  backgroundColor: Colors.pink,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Add Employee",
                  style: TextStyle(color: Colors.white, fontSize: 18,
                      fontWeight: FontWeight.bold
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