

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/mobile_recharge_all/mobile_recharge_pin.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class MobileRechargeAmount extends StatelessWidget
{
  final String recNumb,connectionType,operator,pin,balance;

   //MobileRechargeAmount({super.key, required this.recNumb,required this.connectionType});

  final TextEditingController rechargeAmount=TextEditingController();

   MobileRechargeAmount({super.key, required this.recNumb, required this.connectionType, required this.operator, required this.pin, required this.balance});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Mobile Recharge Amount',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),



      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: AppLayout.getScreenHeight(),width: 320,
          decoration: BoxDecoration(
              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 SizedBox(height: 20,),
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),

                   decoration: BoxDecoration(

                     color: Colors.red.shade50,
                     borderRadius: BorderRadius.circular(15)
                   ),
                   padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [



                       Text("Phone Number : ",
                         style: GoogleFonts.openSans(
                           fontSize: 16,
                         ),

                       ),

                       Gap(15),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(recNumb,
                             style: GoogleFonts.openSans(
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),

                 Container(
                   padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
                   decoration: BoxDecoration(
                       color: Colors.red.shade50,
                       borderRadius: BorderRadius.all(Radius.circular(15))
                   ),
                   margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Recharge Amount : ",
                         style: GoogleFonts.openSans(
                             fontSize: 20,
                             fontWeight: FontWeight.bold
                         ),
                       ),
                       TextField(
                         controller: rechargeAmount,
                         keyboardType: TextInputType.number,
                         cursorColor: Colors.red.shade900,
                         style: GoogleFonts.openSans(
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                             color: Colors.red.shade900
                         ),
                         decoration: InputDecoration(
                           border: InputBorder.none,
                           prefixIcon: Text(" ৳",
                             style: GoogleFonts.openSans(
                               fontSize: 35,
                               fontWeight: FontWeight.bold,

                             ),
                           ),//Icon(Icons.currency_lira,size: 30,color: Colors.red.shade900,),
                           hintText: 'Amount',
                           hintStyle: TextStyle(color: Colors.grey.shade400),
                           suffixIcon: GestureDetector(

                               onTap: (){

                                 if(rechargeAmount.text.toString().isNotEmpty){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) {
                                         return MobileRechargePin(
                                           recNumb: recNumb,
                                           amount: rechargeAmount.text.toString(),
                                           connectionType: connectionType.toString(),
                                           operator: operator.toString(),
                                           pin: pin,
                                           balance: balance,
                                         );
                                       },
                                     ),
                                   );

                                 }
                                 else
                                   {
                                     Fluttertoast.showToast(
                                         msg: "Please enter your amount.Thank You! ",
                                         toastLength: Toast.LENGTH_SHORT,
                                         gravity: ToastGravity.TOP,
                                         timeInSecForIosWeb: 10,
                                         backgroundColor: Colors.red.shade100,
                                         textColor: Colors.black,
                                         fontSize: 16.0
                                     );
                                   }


                               },
                               child: Ink(child: Icon(Icons.arrow_forward_ios))
                           ),
                           suffixIconColor: Colors.red.shade900,
                         ),
                       ),

                       Row(
                         children: [
                           Text("Available Balance : ",
                             style: GoogleFonts.openSans(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold
                             ),
                           ),

                           Text("${balance}",

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
                       )
                     ],
                   ),

                 ),





                 Container(

                   child: Column(
                     children: [

                       ListView.builder(

                           shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount: 10,
                           itemBuilder: (BuildContext context,int index){
                         return Container(
                           decoration: BoxDecoration(
                             color: Colors.red.shade50,
                             borderRadius: BorderRadius.circular(15)
                           ),
                           margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(10)),
                           padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(10)),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Offer Detail",
                                     style: GoogleFonts.openSans(
                                       fontSize: 16
                                     ),

                                   ),
                                   Text("Offer price",
                                     style: GoogleFonts.openSans(
                                         fontSize: 16,
                                       fontWeight: FontWeight.bold
                                     ),
                                   ),
                                 ],
                               ),
                               Text("Offer Duration",
                                 style: GoogleFonts.openSans(
                                     fontSize: 16,
                                   fontWeight: FontWeight.w700
                                 ),
                               ),
                             ],
                           ),
                         );
                       }
                       )


                     ],
                   ),



                 )



               ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }

}