


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FuelPayDashBoard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Fuel Pay',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),

      body: Column(
        children: [
          Container(
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.red.shade100
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox( height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 71.sp,
                      width: 53.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return FuelPayDashBoard();
                            //     },
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  radius: 26,
                                  child: Icon(Icons.oil_barrel_sharp,
                                    color: Colors.red.shade900,
                                    size: 40,
                                  )//Image.asset('assets/images/Quick Pay.png',),

                                //Icon(Icons.receipt_sharp,color: Colors.black)
                              ),
                              const Text('Petrol',style: TextStyle(color:Color(0xFF80140E)))
                            ],
                          )
                      ),
                    ),

                    SizedBox(width: 29.w,),


                    Container(
                      height: 71.sp,
                      width: 53.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white
                      ),
                      //margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: TextButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return BillPayPage(
                            //         firstName: firstName,
                            //         lastName: lastName,
                            //         pin: pin,);
                            //     },
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  radius: 26,
                                  child: Icon(Icons.local_gas_station_outlined,
                                    color: Colors.red.shade900,
                                    size: 40,
                                  )//Image.asset('assets/images/bill_pay.png',),

                                //Icon(Icons.receipt_sharp,color: Colors.black)
                              ),
                              const Text('Disel',style: TextStyle(color:Color(0xFF80140E)))
                            ],
                          )
                      ),
                    ),

                    SizedBox(width: 15,),


                    // Container(
                    //   alignment: Alignment.centerRight,
                    //   child: TextButton(
                    //       style: ButtonStyle(
                    //         shadowColor: MaterialStateProperty.all(Colors.transparent),
                    //         overlayColor: MaterialStateProperty.all(Colors.transparent),
                    //       ),
                    //       onPressed: (){
                    //         // Navigator.push(
                    //         //   context,
                    //         //   MaterialPageRoute(
                    //         //     builder: (context) {
                    //         //       return BankTransferPage();
                    //         //     },
                    //         //   ),
                    //         // );
                    //       },
                    //       child: Column(
                    //         //crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           CircleAvatar(
                    //               backgroundColor: const Color(0xFFFFF8F8),
                    //               radius: 26,
                    //               child: Icon(Icons.account_balance,
                    //                 size: 40,
                    //                 color: Colors.red.shade900,
                    //               )//Image.asset('assets/images/bank_transfer.png',),
                    //           ),
                    //           Text('General\nbanking',style: TextStyle(color:Color(0xFF80140E)))
                    //         ],
                    //       )),
                    // ),




                  ],
                ),

                SizedBox(height: 9.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 71.sp,
                      width: 53.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white
                      ),
                      child: TextButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return FuelPayDashBoard();
                            //     },
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  radius: 26,
                                  child: Icon(Icons.cyclone_outlined,
                                    color: Colors.red.shade900,
                                    size: 40,
                                  )//Image.asset('assets/images/Quick Pay.png',),

                                //Icon(Icons.receipt_sharp,color: Colors.black)
                              ),
                              const Text('Octen',style: TextStyle(color:Color(0xFF80140E)))
                            ],
                          )
                      ),
                    ),

                    SizedBox(width: 30.w,),


                    Container(
                      height: 71.sp,
                      width: 53.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white
                      ),
                      //margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: TextButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return BillPayPage(
                            //         firstName: firstName,
                            //         lastName: lastName,
                            //         pin: pin,);
                            //     },
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  radius: 26,
                                  child: Icon(Icons.ev_station_outlined,
                                    color: Colors.red.shade900,
                                    size: 40,
                                  )//Image.asset('assets/images/bill_pay.png',),

                                //Icon(Icons.receipt_sharp,color: Colors.black)
                              ),
                              const Text('Electric',style: TextStyle(color:Color(0xFF80140E)))
                            ],
                          )
                      ),
                    ),

                    SizedBox(width: 15,),


                    // Container(
                    //   alignment: Alignment.centerRight,
                    //   child: TextButton(
                    //       style: ButtonStyle(
                    //         shadowColor: MaterialStateProperty.all(Colors.transparent),
                    //         overlayColor: MaterialStateProperty.all(Colors.transparent),
                    //       ),
                    //       onPressed: (){
                    //         // Navigator.push(
                    //         //   context,
                    //         //   MaterialPageRoute(
                    //         //     builder: (context) {
                    //         //       return BankTransferPage();
                    //         //     },
                    //         //   ),
                    //         // );
                    //       },
                    //       child: Column(
                    //         //crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           CircleAvatar(
                    //               backgroundColor: const Color(0xFFFFF8F8),
                    //               radius: 26,
                    //               child: Icon(Icons.account_balance,
                    //                 size: 40,
                    //                 color: Colors.red.shade900,
                    //               )//Image.asset('assets/images/bank_transfer.png',),
                    //           ),
                    //           Text('General\nbanking',style: TextStyle(color:Color(0xFF80140E)))
                    //         ],
                    //       )),
                    // ),




                  ],
                ),
                SizedBox(height: 10,),








              ],
            ),
          ),


          Text("Fuel Transections : "),




        ],
      ),
    );
  }

}