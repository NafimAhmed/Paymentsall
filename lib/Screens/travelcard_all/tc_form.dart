

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'doller_endowsement.dart';

class TCForm extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(

        children: [

          Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back,color: Colors.black,)),
              const Text('Trvel card',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ],
          ),



          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NID Number :"),

                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red.shade900,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.credit_card_sharp,size: 30,color: Colors.red.shade300,),
                    hintText: 'Enter your NID No.',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                ),

                Text("Name :"),


                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red.shade900,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.credit_card_sharp,size: 30,color: Colors.red.shade300,),
                    hintText: 'Enter your Name',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                ),


                Text("Date of birth :"),


                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red.shade900,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.credit_card_sharp,size: 30,color: Colors.red.shade300,),
                    hintText: 'Enter your date of birth',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                ),



              ],
            ),
          ),



          SizedBox(height: 10,),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                height: 50,width: 296,
                decoration: BoxDecoration(
                  // border: Border.all(width: 1,color:),
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
                          return Endowsement();
                        },
                      ),
                    );
                  },
                  child: Text('Apply',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                ),
              )
          ),









        ],

      ),
    );
  }

}