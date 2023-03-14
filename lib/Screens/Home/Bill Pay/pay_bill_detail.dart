


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/Home/Bill%20Pay/pay_bill_pin.dart';
//import 'package:payments_all_app/Screens/pay_bill_all/pay_bill_pin.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class PayBillDetails extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String pin;
  const PayBillDetails({super.key, required this.firstName, required this.lastName, required this.pin});

  @override
  State<PayBillDetails> createState() => _PayBillDetailsState();
}

class _PayBillDetailsState extends State<PayBillDetails> {


   List<String> list_month = <String>['January', 'February', 'March', 'April','May', 'June', 'July', 'August','September', 'October', 'Novemver', 'December'];

   List<String> list_year = <String>['2015', '2016', '2017', '2018','2019', '2020', '2021', '2022','2023'];


   final TextEditingController _mobileNo=TextEditingController();


   String dropdownValue_month = 'January';
   String dropdownValue_year = '2015';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Bill Details',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 30,bottom: 16),
          child: Container(
            height: 500,width: 320,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: const Color(0xFFFCDEDE),),
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Receiver : "),

            ListTile(
              leading: Image.asset("assets/images/Payments_All.png"),
              title: Text("Organization name"),
              subtitle: Text(" Bill Type name"),

              onTap: (){

              },

            )
                    ],
                  ),
                ),


                Container(

                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),

                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),

                  width: AppLayout.getScreenWidth(),
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Billing month : "),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                              value: dropdownValue_month,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              // underline: Container(
                              //   height: 2,
                              //   color: Colors.deepPurpleAccent,
                              // ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue_month = value!;
                                });
                              },
                              items: list_month.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),
                                  ),
                                );
                              }).toList(),
                  ),
                            ),
                          ),
                        ),




                        Container(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: dropdownValue_year,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                // underline: Container(
                                //   height: 2,
                                //   color: Colors.deepPurpleAccent,
                                // ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue_year = value!;
                                  });
                                },
                                items: list_year.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                      style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )


                    ],
                  ),
                ),



                Container(

                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getWidth(10)),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Text("Account number : "),

                      TextField(
                        controller: _mobileNo,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.account_balance,size: 30,color: Colors.red.shade900,),
                          hintText: 'Enter Account number',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: InkWell(
                              onTap:() {
                                if(_mobileNo.text.isNotEmpty){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PayBillPin(
                                          firstName: widget.firstName,
                                          lastName: widget.lastName,
                                          pin: widget.pin,);
                                      },
                                    ),
                                  );
                                }
                                else
                                  {
                                    Fluttertoast.showToast(
                                        msg: "Please enter your Account number.Thank You! ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 10,
                                        backgroundColor: Colors.red.shade100,
                                        textColor: Colors.black,
                                        fontSize: 16.0
                                    );
                                  }


                              },
                              child: Icon(Icons.arrow_forward,size: 30,color: Colors.red.shade900,)),
                          suffixIconColor: Color(0xFFFCDEDE),
                        ),
                      ),




                    ],
                  ),
                ),








              ],
            ),
          ),
        ),
      ),

    );
  }
}