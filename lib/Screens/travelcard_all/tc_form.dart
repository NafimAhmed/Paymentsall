

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payments_all_app/utils/app_layout.dart';
import 'package:sizer/sizer.dart';

import 'doller_endowsement.dart';

class TCForm extends StatelessWidget
{
  final String phoneNumber;

  const TCForm({super.key, required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Trvel card',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(

          children: [

            // Row(
            //   children: [
            //     TextButton(
            //         style: ButtonStyle(
            //           shadowColor: MaterialStateProperty.all(Colors.transparent),
            //           overlayColor: MaterialStateProperty.all(Colors.transparent),
            //         ),
            //         onPressed: (){
            //           Navigator.pop(context);
            //         },
            //         child: const Icon(Icons.arrow_back,color: Colors.black,)),
            //     const Text('Trvel card',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            //   ],
            // ),



            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("NID Number :"),
                  //
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   cursorColor: Colors.red.shade900,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.credit_card_sharp,size: 30,color: Colors.red.shade300,),
                  //     hintText: 'Enter your NID No.',
                  //     hintStyle: TextStyle(color: Colors.grey.shade400),
                  //   ),
                  // ),

                  Text('   NID Number :',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


                  Container(
                    padding: EdgeInsets.fromLTRB(0,10,0,0),
                    child: TextField(
                      maxLength: 15,
                      //controller: _mobileNumber,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(

                          prefixIcon:Icon(Icons.credit_card_sharp,size: 30,color: Colors.red.shade300,),

                          // suffixIcon: Icon(Icons.contact_phone_outlined),
                          // suffixIconColor: Color(0xFFFCDEDE),


                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                          ),

                          hintText: "NID Number",

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






                  //
                  // Text("Passport Number :"),
                  //
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   cursorColor: Colors.red.shade900,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.book,size: 30,color: Colors.red.shade300,),
                  //     hintText: 'Enter your Passport No.',
                  //     hintStyle: TextStyle(color: Colors.grey.shade400),
                  //   ),
                  // ),






                  Text('   Passport Number : ',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


                  Container(
                    padding: EdgeInsets.fromLTRB(0,10,0,0),
                    child: TextField(
                      maxLength: 15,
                      //controller: _mobileNumber,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(

                          prefixIcon:Icon(Icons.book,size: 30,color: Colors.red.shade300,),

                          // suffixIcon: Icon(Icons.contact_phone_outlined),
                          // suffixIconColor: Color(0xFFFCDEDE),


                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                          ),

                          hintText: "Passport Number",

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








                  // Text("Electricity Utility bill No. :"),
                  //
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   cursorColor: Colors.red.shade900,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.book,size: 30,color: Colors.red.shade300,),
                  //     hintText: 'Enter your Utility bill No.',
                  //     hintStyle: TextStyle(color: Colors.grey.shade400),
                  //   ),
                  // ),


                  Text('   Electricity Utility Bill No : ',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


                  Container(
                    padding: EdgeInsets.fromLTRB(0,10,0,0),
                    child: TextField(
                      maxLength: 15,
                      //controller: _mobileNumber,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(

                          prefixIcon:Icon(Icons.receipt,size: 30,color: Colors.red.shade300,),

                          // suffixIcon: Icon(Icons.contact_phone_outlined),
                          // suffixIconColor: Color(0xFFFCDEDE),


                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                          ),

                          hintText: "Electricity Utility Bill No",

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











                  // Text("Name :"),
                  //
                  //
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   cursorColor: Colors.red.shade900,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.person,size: 30,color: Colors.red.shade300,),
                  //     hintText: 'Enter your Name',
                  //     hintStyle: TextStyle(color: Colors.grey.shade400),
                  //   ),
                  // ),




                  Text('   Name : ',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


                  Container(
                    padding: EdgeInsets.fromLTRB(0,10,0,0),
                    child: TextField(
                      //maxLength: 15,
                      //controller: _mobileNumber,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(

                          prefixIcon:Icon(Icons.person,size: 30,color: Colors.red.shade300,),

                          // suffixIcon: Icon(Icons.contact_phone_outlined),
                          // suffixIconColor: Color(0xFFFCDEDE),


                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                          ),

                          hintText: "Enter your name",

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


                  SizedBox(height: 20.sp,),




                  Text('   Date of Birth (DD/MM/YYYY) : ',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


                  Container(
                    padding: EdgeInsets.fromLTRB(0,10,0,0),
                    child: TextField(
                     // maxLength: 15,
                      //controller: _mobileNumber,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(

                          prefixIcon:Icon(Icons.person,size: 30,color: Colors.red.shade300,),

                          // suffixIcon: Icon(Icons.contact_phone_outlined),
                          // suffixIconColor: Color(0xFFFCDEDE),


                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                          ),

                          hintText: "Date of Birth (DD/MM/YYYY) :",

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







                  // Text("Date of birth :"),
                  //
                  //
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   cursorColor: Colors.red.shade900,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.date_range,size: 30,color: Colors.red.shade300,),
                  //     hintText: 'Enter your date of birth',
                  //     hintStyle: TextStyle(color: Colors.grey.shade400),
                  //   ),
                  // ),



                ],
              ),
            ),



            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  height: 50,width: 296,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1,color:),
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
                            return Endowsement(
                              phoneNumber: phoneNumber,
                            );
                          },
                        ),
                      );
                    },
                    child: Text('Apply',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                  ),
                )
            ),









          ],

        ),
      ),
    );
  }

}