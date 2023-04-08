

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/Home/Bill%20Pay/pay_bill_confirmation.dart';

import '../../../utils/app_layout.dart';
//import 'package:payments_all_app/Screens/pay_bill_all/pay_bill_confirmation.dart';

//import '../../utils/app_layout.dart';

class PayBillPin extends StatefulWidget {
    final String firstName;
  final String lastName;
  final String pin;

    final String Billing_Month,Billing_Year;

  final String organizationName,BillType,Org_AccountNumber;

  const PayBillPin({super.key, required this.firstName, required this.lastName, required this.pin, required this.Billing_Month, required this.Billing_Year, required this.organizationName, required this.BillType, required this.Org_AccountNumber});

  //const PayBillPin({super.key, required this.firstName, required this.lastName, required this.pin, required this.organizationName, required this.BillType, required this.Org_AccountNumber});
//
  //const PayBillPin({super.key, required this.firstName, required this.lastName, required this.pin});

  @override
  State<PayBillPin> createState() => _PayBillPinState();
}

class _PayBillPinState extends State<PayBillPin> {


//


  final TextEditingController _pinB=TextEditingController();
// class PayBillPin extends StatelessWidget{

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text('Bill Confirmation',style: TextStyle(color: Colors.black),),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFFFF8F8),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xFFFFF8F8),

        body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 16,bottom: 16),
          child: Container(
            height: 550,width: 320,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: const Color(0xFFFCDEDE),),
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
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
                        title: Text("${widget.organizationName}"),
                        subtitle: Text(" ${widget.BillType}"),

                        onTap: (){

                        },

                      )
                    ],
                  ),
                ),

                Container(

                  width: AppLayout.getScreenWidth(),


                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getWidth(10)),



                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Billing Month and Year : "),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.Billing_Month} ${widget.Billing_Year}",
                          style: GoogleFonts.openSans(
                            fontSize: 20
                          ),
                          ),
                        ],
                      ),





                    ],
                  ),
                ),


                Container(

                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                 // margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getWidth(10)),

                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),
                  child: Column(
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                        child: Row(
                          children: [
                            Text("Summery : ",
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      Table(

                        border: TableBorder.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow( children: [
                            Column(children:[Text('Account no :\n 123456789', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text('Account Name :\n ${widget.firstName}${widget.lastName}', style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]),

                          TableRow( children: [
                            Column(children:[Text('Due date : \n 01/02/2023', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text("Status : \n Unpaid", style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]),

                          TableRow( children: [
                            Column(children:[Text('Amount : ', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text("৳ 250", style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]),







                        ],
                      ),


                      SizedBox(height: 10,),


                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                        child: Row(
                          children: [
                            Text("PIN : ",
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,width: 296,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),



                          child: GestureDetector(
                            child: TextField(
                              controller: _pinB,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red.shade900,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock,size: 30,color: Colors.red.shade900,),
                                hintText: 'Enter PIN',
                                hintStyle: TextStyle(color: Colors.grey.shade400),
                                suffixIcon: InkWell(
                                    onTap:() {
                                      if(_pinB.text.isNotEmpty && _pinB.text.toString()==widget.pin){

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return PayBillconfirmation(
                                                Billing_Month: widget.Billing_Month,
                                                Billing_Year: widget.Billing_Year,
                                                firstName: widget.firstName,
                                                organizationName: widget.organizationName,
                                                Org_AccountNumber: widget.Org_AccountNumber,
                                                BillType: widget.BillType,
                                                lastName: widget.lastName,);
                                            },
                                          ),
                                        );
                                      }
                                      else
                                        {
                                          Fluttertoast.showToast(
                                              msg: "Please enter your PIN correctly.Thank You! ",
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
                            onTap: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),



                        ),
                      ),




                    ],
                  ),
                ),













              ],
            ),
          ),
        ),
      )
    );
  }

}