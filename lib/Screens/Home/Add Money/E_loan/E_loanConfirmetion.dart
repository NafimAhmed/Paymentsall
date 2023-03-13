import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'E-LoanConfirmPage.dart';

class EloanConfirmationpage extends StatefulWidget {

  //final String firstName,lastName,phoneNumber;

  const EloanConfirmationpage({Key? key}) : super(key: key);
 // const EloanConfirmationpage({super.key, required this.firstName, required this.lastName, required this.phoneNumber});

  @override
  State<EloanConfirmationpage> createState() => _EloanConfirmationpageState();
}

class _EloanConfirmationpageState extends State<EloanConfirmationpage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        title: Row(
          children: [
            Text('E-Loan',style: TextStyle(color: Colors.black)),
            Spacer(),
            TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: const Icon(
                              Icons.hexagon,color: Color(0xFFE57373),
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: const Icon(
                              Icons.star,color: Colors.white,size: 14,
                            ),

                          ),
                        ),

                      ],
                    ),
                    Text('0 Points',style: TextStyle(color: Colors.red.shade900)),
                  ],
                ))
          ],
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),

      ),
      backgroundColor: Color(0xFFFFF8F8),
      
      
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: AppLayout.getScreenHeight(),width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white
          ),


          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: Container(
                    height: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Received Info'),
                        ListTile(
                          leading: Icon(Icons.account_circle,size: 60,color: Colors.grey.shade200,),
                          title: Text("abcd"),
                          subtitle: Text("01xxxxxxxxxx"),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(color:  Color(0xFFFFF8F8),thickness: 5,),

                Container(
                  height: 100,
                  width: 330,
                  child: Table(
                    border: TableBorder.all(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1),

                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          children: [
                            Column(children:[Text('Loan Amount\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text('Interests\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text('Total Payment\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]),
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          children: [
                            Column(children:[Text('৳ .00', style: TextStyle(fontSize: 16.0))]),
                            Column(children:[Text('+৳ 0.00', style: TextStyle(fontSize: 16.0))]),
                            Column(children:[Text('৳ .00', style: TextStyle(fontSize: 16.0))]),
                          ]),

                    ],
                  ),

                ),

                Container(
                  child: Table(
                    border: TableBorder.all(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1),

                    children: [
                      TableRow(
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          children: [
                            Column(children:[Text('Received Amount \n ৳.00', style: GoogleFonts.openSans(fontSize: 16.0))]),
                            Column(children:[Text('Processing Fees \n ৳.00', style: GoogleFonts.openSans(fontSize: 16.0))]),
                          ]
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Divider(color:  Color(0xFFFFF8F8),thickness: 5,),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,width: 330,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white
                    ),



                    child: TextField(
                      //controller: _mobileNo,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock,size: 20,color: Colors.red.shade300,),
                        hintText: 'Enter PIN',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        suffixIcon: InkWell(
                            onTap:() {
                              //
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EloanConfirmPage();
                                  },
                                ),
                              );

                            },
                            child: Icon(Icons.arrow_forward,size: 22,color: Colors.red.shade300,)),
                        suffixIconColor: Color(0xFFFCDEDE),
                      ),
                    ),



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
