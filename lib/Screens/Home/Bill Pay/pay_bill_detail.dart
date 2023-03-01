


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/Home/Bill%20Pay/pay_bill_pin.dart';
//import 'package:payments_all_app/Screens/pay_bill_all/pay_bill_pin.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class PayBillDetil extends StatefulWidget
{

  @override
  State<PayBillDetil> createState() => _PayBillDetilState();
}

class _PayBillDetilState extends State<PayBillDetil> {
   List<String> list_month = <String>['January', 'February', 'March', 'April','May', 'June', 'July', 'August','September', 'October', 'Novemver', 'December'];

   List<String> list_year = <String>['2015', '2016', '2017', '2018','2019', '2020', '2021', '2022','2023'];





   String dropdownValue_month = 'January';
   String dropdownValue_year = '2015';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [



          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
                const Text('Bill Detail',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
          ),





          Container(
            decoration: BoxDecoration(
                color: Colors.red.shade100,
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
                color: Colors.red.shade100,
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




                  Container(
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
                ],
              )


              ],
            ),
          ),



          Container(

            decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getWidth(10)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text("Account number : "),

                TextField(
                  //controller: _mobileNo,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red.shade900,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.account_balance,size: 30,color: Colors.red.shade900,),
                    hintText: 'Enter Account number',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: InkWell(
                        onTap:() {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PayBillPin();
                              },
                            ),
                          );

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

    );
  }
}