

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/mobile_recharge_all/mobile_recharge_pin.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class MobileRechargeAmount extends StatelessWidget
{
  final String recNumb,connectionType,operator;

   //MobileRechargeAmount({super.key, required this.recNumb,required this.connectionType});

  final TextEditingController rechargeAmount=TextEditingController();

   MobileRechargeAmount({super.key, required this.recNumb, required this.connectionType, required this.operator});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [

           SizedBox(height: 30,),

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
                     child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                 Text('Recharge Amount',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
               ],
             ),
           ),

           Container(
             margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),

             decoration: BoxDecoration(

               color: Colors.red.shade100,
               borderRadius: BorderRadius.circular(15)
             ),
             padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [



                 Text("Phone Number : ",
                   style: GoogleFonts.openSans(
                     fontSize: 15,
                   ),

                 ),

                 Gap(15),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(recNumb,
                       style: GoogleFonts.openSans(
                         fontSize: 25,
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
                 color: Colors.red.shade100,
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

                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) {
                                 return MobileRechargePin(
                                   recNumb: recNumb,
                                   amount: rechargeAmount.text.toString(),
                                   connectionType: connectionType,
                                   operator: operator,
                                 );
                               },
                             ),
                           );


                         },
                         child: Ink(child: Icon(Icons.arrow_forward_ios))
                     ),
                     suffixIconColor: Colors.red.shade900,
                   ),
                 ),

                 Row(
                   children: [
                     Text("Aveilable Balance : ",
                       style: GoogleFonts.openSans(
                           fontSize: 15,
                           fontWeight: FontWeight.bold
                       ),
                     ),

                     Text("100.00",

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
                       color: Colors.red.shade100,
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
                                 fontSize: 20
                               ),

                             ),
                             Text("Offer price",
                               style: GoogleFonts.openSans(
                                   fontSize: 20,
                                 fontWeight: FontWeight.bold
                               ),
                             ),
                           ],
                         ),
                         Text("Offer Duration",
                           style: GoogleFonts.openSans(
                               fontSize: 20,
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
      ) ,
    );
  }

}