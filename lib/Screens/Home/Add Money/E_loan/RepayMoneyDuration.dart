import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'E_loanDetails.dart';

class RepayMoneyDurationAndAmount extends StatefulWidget {
  const RepayMoneyDurationAndAmount({Key? key}) : super(key: key);

  @override
  State<RepayMoneyDurationAndAmount> createState() => _RepayMoneyDurationAndAmountState();
}

class _RepayMoneyDurationAndAmountState extends State<RepayMoneyDurationAndAmount> {


  TextEditingController _amountLoan=TextEditingController();


  List<String> timeLimitList = <String>['3 Month', '4 Month', '5 Month', '6 Month','7 Month', '8 Month', '9 Month'];

  String timeLimit = '3 Month';


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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,width: 330,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white
                ),




                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text('Amount',
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                      ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.red.shade50
                        ),


                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: TextField(
                            controller: _amountLoan,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Amount',
                              hintStyle: GoogleFonts.openSans(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500,

                              ),

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(color: Color(0xFFFFF8F8),thickness: 4,),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text('Useable E-Loan Limit: ৳10,000.00',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(color: Color(0xFFFFF8F8),thickness: 4,),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text('E-Loan Reimbursement Time Limit',

                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.red.shade50
                        ),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                                value: timeLimit,
                                onChanged: (String? value){
                                  setState(() {
                                    timeLimit=value!;
                                  });
                                },
                                items: timeLimitList.map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: GoogleFonts.openSans(
                                      // fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  );
                                },
                                ).toList()
                            ),

                          ),
                        ),
                      ),
                    ),

                    Divider(color: Color(0xFFFFF8F8),thickness: 4,),

                  ],
                ),
              ),
              SizedBox(height: 70,),
              Container(
                height: 40,
                decoration: BoxDecoration(
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
                          return ELoanDetailsPage();
                        },
                      ),
                    );

                  },
                  child: Row(
                    children: [
                      Text('Next',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                      Spacer(),
                      Icon(Icons.arrow_forward,color: Colors.white,)
                    ],
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
