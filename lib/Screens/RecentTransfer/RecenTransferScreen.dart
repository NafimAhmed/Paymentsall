import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class RecentTransferScreen extends StatelessWidget {
  const RecentTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),




      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              SafeArea(
                child: Row(
                  children: [
                    TextButton(
                        onPressed: (){},
                        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                    Text('All Transections',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                  ],
                ),
              ),




              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context,int index){

                    return Container(
                      //color: Colors.red.shade100,
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                          border: Border.all(
                            color: Colors.red.shade100,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),



                      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),
                      margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5),vertical: AppLayout.getHeight(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Pay Bill",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Text("DESCO",
                            style: GoogleFonts.openSans(
                                fontSize: 17,
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Text("Transaction ID : DEX123546",
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.normal
                            ),
                          ),

                          Text("12:50 pm, 22/02/2023",

                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.normal
                            ),

                          ),



                        ],
                      ),
                    );

              }
              ),







            ],
          ),
        ),
      ));
  }
}
