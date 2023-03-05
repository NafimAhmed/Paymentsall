



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_layout.dart';

class Collection_point extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                const Text('Endowsement',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),




            ListView.builder(


              itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (BuildContext context,int index){

                  return Container(

                      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
                  decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),



                    child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Branch name",

                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),

                        ),
                        Text("Location"),

                      ],
                    ) ,
                  );
                }

            )



          ],
        ),
      ),
    );
  }

}