

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/marchent_pay_all/marchent_pay_pin.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class MarchentPayAmount extends StatelessWidget
{

  final String reveiverNumb;

  MarchentPayAmount({super.key, required this.reveiverNumb});

  TextEditingController _mobileNo=TextEditingController();




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 30,),
          SafeArea(
            child: Row(
              children: [
                TextButton(
                    onPressed: (){},
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                Text('Marchent pay Amount',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
              ],
            ),
          ),

          SizedBox(height: 40,),



          Container(
            width: AppLayout.getScreenWidth(),
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
            decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(10)),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Receiver : ",
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),

                Text(reveiverNumb,
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                  ),
                )

              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Amount : "),

                TextField(
                  controller: _mobileNo,
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
                                return MarchentPayPin(receiverNumb: reveiverNumb,amount: _mobileNo.text.toString(),);
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
                ),



              ],
            ),
          )





        ],
      ),
    );
  }

}