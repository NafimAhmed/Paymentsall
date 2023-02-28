import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'ProfilePage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

 static List<String>_language=['English','বাংলা'];
 String select='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,

        title: Text('Settings & Account',
        style: TextStyle(
            color: Colors.black
        ),
        ),

        iconTheme: IconThemeData(
            color: Colors.black),
      ),

      backgroundColor: Color(0xFFFFF8F8),


      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16),vertical: AppLayout.getHeight(16)),
            child: Center(
              child: Container(
                height: AppLayout.getHeight(120),
                  width: AppLayout.getWidth(320),


                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFFCDEDE),),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),



                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {  },
                          child: Icon(Icons.account_circle_rounded,size: 100,color: Colors.grey,)),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height:30,),
                          Text('Nafim Ahmed',
                            
                            
                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          ),
                          
                          
                          Text('Nafim0123@gmail.com',
                              
                              
                              style: GoogleFonts.openSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500
                              ),
                          ),
                          
                          
                          
                          Text('017XXXXXXXX',
                              
                              
                              style: GoogleFonts.openSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500
                              ),
                          ),
                          
                          
                        ],
                      )
                    ],
                  )
              ),
            ),
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16),vertical: AppLayout.getHeight(16)),
            child: Container(
              height: AppLayout.getHeight(600),
              width: AppLayout.getWidth(320),


              decoration: BoxDecoration(
                //  border: Border.all(width: 1, color: Color(0xFFFCDEDE),),
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white
              ),


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  Padding(padding: EdgeInsets.only(left:AppLayout.getWidth(16)),
                    child: Text('ACCOUNT',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                  ),

                  
                  TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),


                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );


                    },
                    child: Row(
                      children: [
                        Icon(Icons.manage_accounts_sharp,color: Colors.red.shade300,),SizedBox(width: 10,),
                        Text('Profile',
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                  ),





                  Divider(indent: 10,endIndent: 14,),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16),vertical: AppLayout.getHeight(16)),
                    child: Text('SETTINGS',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: AppLayout.getHeight(8),bottom: AppLayout.getWidth(8),right: AppLayout.getHeight(8)),
                    child: Row(
                      children: [
                        Icon(Icons.language_sharp,color: Colors.red.shade300,),SizedBox(width: 10,),
                        Text('Language',
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              color: Colors.black
                          ),
                        ),
                        Expanded(
                          child:  DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                               onChanged: (newValue){ },
                              items: _language.map((e) {
                                return DropdownMenuItem(
                                    value: e,
                                    child: Text(e)
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),


                  TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {  },
                      child: Row(
                        children: [
                          Icon(Icons.gpp_good_sharp,color: Colors.red.shade300,),SizedBox(width: 10,),
                          Text('Permissions',
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.black
                            ),
                          )
                        ],
                      )
                  ),

                  Divider(indent: 10,endIndent: 14,),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16),vertical: AppLayout.getHeight(16)),
                    child: Text('HELP & LEGAL',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                  ),



                  TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.help,color: Colors.red.shade300,),SizedBox(width: 10,),
                          Text('Help',
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.black
                            ),
                          )
                        ],
                      )
                  ),


                  TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.phone_callback_sharp,color: Colors.red.shade300,),SizedBox(width: 10,),
                          Text('Contact Us',
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.black
                            ),
                          )
                        ],
                      )
                  ),



                  Divider(indent: 10,endIndent: 14,),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16),vertical: AppLayout.getHeight(16)),
                    child: Text('MORE',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                  ),


                  TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.star_rate_outlined,color: Colors.red.shade300,),SizedBox(width: 10,),
                          Text('Rate Us',
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.black
                            ),
                          )
                        ],
                      )
                  ),

                  TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.logout,color: Colors.red.shade300,),SizedBox(width: 10,),
                          Text('Log out',
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.black
                            ),
                          )
                        ],
                      )
                  ),




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
