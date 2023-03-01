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

  List<String> list_month = <String>['English', 'Bangla'];
  String dropdownValue_month = 'English';



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
              padding: EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                height: 120,
                  width: 320,


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
                          child: Icon(Icons.account_circle_rounded,size: 100,)),
                      Column(
                        children: [
                          const SizedBox(height:40,),
                          Text('User Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20)), SizedBox(height: 5,),
                          Text('Phone Number',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),SizedBox(height: 5,),
                        ],
                      )
                    ],
                  )
              ),
            ),
            ),



            Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
            child: Container(
              height:  600,
              width: 320,


              decoration: BoxDecoration(
                //  border: Border.all(width: 1, color: Color(0xFFFCDEDE),),
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white
              ),


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),

                  Padding(padding: EdgeInsets.only(left: 16.0),
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
                        Icon(Icons.manage_accounts_sharp),SizedBox(width: 10,),
                        Text('Profile')
                      ],
                    ),
                  ),





                  Divider(indent: 10,endIndent: 14,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('SETTINGS',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                  ),

                  TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.language_sharp),
                              SizedBox(width: 10,),
                              Text('Language')
                            ],

                          ),

                          Container(
                            child: DropdownButton<String>(
                              value: dropdownValue_month,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              // underline: Container(
                              //   height: 2,
                              //   color: Colors.deepPurpleAccent,
                              // ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue_month = value!;
                                });
                              },
                              items: list_month.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                    style: GoogleFonts.openSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),






                        ],
                      )
                  ),


                  TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {  },
                      child: Row(
                        children: [
                          Icon(Icons.gpp_good_sharp),SizedBox(width: 10,),
                          Text('Permissions')
                        ],
                      )
                  ),

                  Divider(indent: 10,endIndent: 14,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                          Icon(Icons.help),SizedBox(width: 10,),
                          Text('Help')
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
                          Icon(Icons.phone_callback_sharp),SizedBox(width: 10,),
                          Text('Contact Us')
                        ],
                      )
                  ),



                  Divider(indent: 10,endIndent: 14,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                          Icon(Icons.star_rate_outlined),SizedBox(width: 10,),
                          Text('Rate Us')
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
                          Icon(Icons.logout),SizedBox(width: 10,),
                          Text('Log out')
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
