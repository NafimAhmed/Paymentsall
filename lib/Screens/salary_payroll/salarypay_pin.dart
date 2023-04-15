



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/salary_payroll/salary_confirmation.dart';

import '../../utils/app_layout.dart';

// class SalaryPayPin extends StatelessWidget{

  class SalaryPayPin extends StatefulWidget {
    final String pin,balance,amount,UserPhone;

  const SalaryPayPin({super.key, required this.pin, required this.balance, required this.amount,required this.UserPhone});
    //const SalaryPayPin({Key? key, required this.pin}) : super(key: key);

    @override
    State<SalaryPayPin> createState() => _SalaryPayPinState();
  }

  class _SalaryPayPinState extends State<SalaryPayPin> {



    final TextEditingController _pinS =TextEditingController();

    bool _obscureText = true;


    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Salary Payroll',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
      ),

      backgroundColor: Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 16,bottom: 16),
          child: Container(
            height: 500,width: 320,
            decoration: BoxDecoration(
                border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
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
                          Text(" ৳ ${widget.amount}",
                            style: GoogleFonts.openSans(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade900
                            ),
                          ),


                          // InkWell(
                          //   onTap: (){
                          //
                          //
                          //
                          //   },
                          //   child: Icon(
                          //     Icons.arrow_forward_ios,
                          //     size: 40,
                          //   ),
                          // )



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

                          Text("${widget.balance}",

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





                      Container(
                        margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(2),vertical: AppLayout.getHeight(20)),
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(8),vertical: AppLayout.getHeight(20)),
                        decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        child: Column(
                          children: [
                            Table(
                              children: [
                                TableRow( children: [
                                  Column(children:[Text('Total\nAmount\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                                  Column(children:[Text('Charge\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                                  Column(children:[Text('Total\nAmount\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                                ]),
                                TableRow( children: [
                                  Column(children:[Text('৳ ${widget.amount}', style: TextStyle(fontSize: 16.0))]),
                                  Column(children:[Text('+৳ 0.00', style: TextStyle(fontSize: 16.0))]),
                                  Column(children:[Text('৳ ${widget.amount}', style: TextStyle(fontSize: 16.0))]),
                                ]),

                              ],
                            ),

                            SizedBox(height: AppLayout.getHeight(25),),


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
                                    controller: _pinS,
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

                                            if(_pinS.text.isNotEmpty && _pinS.text.toString()==widget.pin){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return SalaryConfirmation(
                                                      Amount: widget.amount,
                                                      balance: widget.balance,
                                                      UserPhone: widget.UserPhone,
                                                    );
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

              ],
            ),
          ),
        ),
      ),
    );
  }

}