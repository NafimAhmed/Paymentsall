import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class ProfilePage extends StatefulWidget {

  final String first_name,last_name,number,gender,dob;

 // const ProfilePage({Key? key}) : super(key: key);
  const ProfilePage({super.key, required this.first_name, required this.last_name, required this.number, required this.gender, required this.dob});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
        title: Text('Profile',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16),vertical: AppLayout.getHeight(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            TextButton(
              onPressed: (){},
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                  radius: 50,
                  child: Icon(Icons.perm_identity,size: 100,color: Colors.white,)),
            ),


            SizedBox(height: 10,),
            
          Container(
            height: AppLayout.getHeight(310),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text('NAME',style: GoogleFonts.openSans(
                      color: Colors.grey
                  ),),
                  SizedBox(height: 5,),
                  Text('${widget.first_name} ${widget.last_name}',style: GoogleFonts.openSans(
                    fontSize: 15,
                    color: Colors.black
                  ),
            ),

                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),


                  Text('EMAIL',style: GoogleFonts.openSans(
                      color: Colors.grey
                  ),),
                  SizedBox(height: 5,),
                  Text('emu0123@gmail.com',style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Colors.black
                  ),),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),

                  Text('PHONE NUMBER',style: GoogleFonts.openSans(
                      color: Colors.grey
                  ),),
                  SizedBox(height: 5,),
                  Text('${widget.number}',style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Colors.black
                  ),),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('GENDER',style: GoogleFonts.openSans(
                              color: Colors.grey
                          ),),
                          Text('${widget.gender}',style: GoogleFonts.openSans(
                              fontSize: 15,
                              color: Colors.black
                          ),),
                        ],
                      ),
                      SizedBox(width: 150,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DATE OF BIRTH',style: GoogleFonts.openSans(
                              color: Colors.grey
                          ),),
                          Text('${widget.dob}',style: GoogleFonts.openSans(
                              fontSize: 15,
                              color: Colors.black
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
      
      
              
            
          ],
        ),
      ),
    );
  }
}
