import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'PayConfirmation.dart';

class FeesPage extends StatefulWidget {
  const FeesPage({Key? key}) : super(key: key);

  @override
  State<FeesPage> createState() => _FeesPageState();
}

class _FeesPageState extends State<FeesPage> {
  TextEditingController _number= TextEditingController();
  TextEditingController _name= TextEditingController();
  TextEditingController _amount= TextEditingController();

  List<String> monthList = <String>['January', 'February', 'March', 'April','May', 'June', 'July', 'August','September', 'October', 'Novemver', 'December'];

  List<String> yearList = <String>['2015', '2016', '2017', '2018','2019', '2020', '2021', '2022','2023'];

  String month = 'January';
  String year = '2015';


  DateTime selectedDate = DateTime.now();
  String dateFormat= DateFormat('yMMMMd').format(DateTime.now());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<String> statusList=['Paid','Unpaid'];
  String status = 'Paid';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        title: Text('Government Fees',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
               height: 600,width: 330,
                decoration: BoxDecoration(
                   // border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Container(
                      height: 90,width: 330,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('   To',style: TextStyle(color: Colors.red.shade900)),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.red.shade50,
                                child: Image.asset('assets/images/ait.png',height: 30,)),
                            title: Text('Land Development(LD) Tax'),
                            subtitle: Text('Govt. Fees'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 70,
                      width: 330,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('   Bill Period',
                            style: GoogleFonts.openSans(
                              color: Colors.red.shade900,
                                fontWeight: FontWeight.w400
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month,color: Colors.red.shade200,),

                              DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: month,
                                    onChanged: (String? value){
                                      setState(() {
                                        month=value!;
                                      });
                                    },
                                    items: monthList.map<DropdownMenuItem<String>>((String value){
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
                              DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                      value: year,
                                      onChanged: (String? value){
                                        setState(() {
                                          year=value!;
                                        });
                                      },
                                      items: yearList.map<DropdownMenuItem<String>>((String value){
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,style: GoogleFonts.openSans(
                                            //  fontSize: 16,
                                              fontWeight: FontWeight.w400
                                          ),),
                                        );
                                      },
                                      ).toList()
                                  ),

                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          height: 70,width: 190,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12,top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Account Number',
                                  style: GoogleFonts.openSans(
                                      color: Colors.red.shade900,
                                      fontWeight: FontWeight.w400
                                  ),),
                                TextField(
                                  controller: _number,
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.red.shade900,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // prefixIcon: Icon(Icons.attach_money_rounded,size: 30,color: Colors.grey,),
                                    hintText: 'Account Number',
                                    hintStyle: TextStyle(color: Colors.grey.shade400),

                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: 70,width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12,top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Account Name', style: GoogleFonts.openSans(
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.w400
                                ),),
                                TextField(
                                  controller: _name,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.red.shade900,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // prefixIcon: Icon(Icons.attach_money_rounded,size: 30,color: Colors.grey,),
                                    hintText: 'Name',
                                    hintStyle: TextStyle(color: Colors.grey.shade400),

                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),


                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          height: 70,width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12,top: 0),
                             child:  Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('Due Date', style: GoogleFonts.openSans(
                                   color: Colors.red.shade900,
                                     fontWeight: FontWeight.w400

                                 ),),
                                 SizedBox(height: 12,),
                                 InkWell(
                                   onTap: (){
                                     _selectDate(context);
                                   },
                                   child: Center(
                                     child: Text(
                                       dateFormat,
                                       style: GoogleFonts.openSans(
                                         fontSize: 16,
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                          ),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: 70,width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12,top: 0),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Status',style: GoogleFonts.openSans(
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.w400
                                ),
                                ),
                                Center(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                          value: status,
                                          onChanged: (String? value){
                                            setState(() {
                                              status=value!;
                                            });
                                          },
                                          items: statusList.map<DropdownMenuItem<String>>((String value){
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value,style: GoogleFonts.openSans(
                                                //  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),),
                                            );
                                          },
                                          ).toList()
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),


                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 110,width: 330,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('    Amount',style: GoogleFonts.openSans(
                              color: Colors.red.shade900,
                              fontWeight: FontWeight.w400
                          ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _amount,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.red.shade900,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.red.shade50,
                                border: InputBorder.none,
                                hintText: 'Amount',
                                hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 20),

                              ),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text('    Available Balance:  ৳1000.00',style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),


                    Padding(padding: EdgeInsets.only(left: 5),
                        child: Container(
                          height: 40,width: 270,
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
                                    return PayConfirmationPage();
                                  },
                                ),
                              );

                            },
                            child: Row(
                              children: [
                                Text('Proceed to Pay',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                                Spacer(),
                                Icon(Icons.arrow_forward,color: Colors.white,)
                              ],
                            ),
                          ),
                        )
                    ),


                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
