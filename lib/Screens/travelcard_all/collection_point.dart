



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/travelcard_all/card_status.dart';

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
                const Text('Collection point',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),




            ListView.builder(


              itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (BuildContext context,int index){

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListTile(
                      tileColor: Colors.red.shade100,


                      title: Text("Branch name",
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      subtitle: Text("Location"),

                      onTap: (){


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CardStatus();
                            },
                          ),
                        );



                      },

                    ),
                  );
                }

            )





          ],
        ),
      ),
    );
  }

}