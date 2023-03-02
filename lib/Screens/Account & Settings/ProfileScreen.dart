import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/Account%20&%20Settings/AboutUs.dart';
import 'package:payments_all_app/Screens/Account%20&%20Settings/contact_us.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../utils/Theme.dart';
import 'ProfilePage.dart';
import 'help.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool _darkTheme=true;

  List<String> list_month = <String>['English', 'Bangla'];
  String dropdownValue_month = 'English';



  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,

        title: Text('Settings & Account',

          //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

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
                          child: Icon(Icons.account_circle_rounded,size: 100,color: Colors.grey.shade300,)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height:25,),
                          Text('Nafim Ahmed',
                           // style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20)
                            ),
                            SizedBox(height: 5,),
                          Text('nafim0123@gmail.com',
                            //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
                               style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)
                          ),SizedBox(height: 5,),
                          Text('017XXXXXXXX',
                            //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                             style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)
                          ),SizedBox(height: 5,),
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
              height:  700,
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
                    child: Text('ACCOUNT',
                      //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
                      style: TextStyle(color: Colors.grey.shade700,fontSize: 12)
                    ),
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
                        Text('Profile',
                          //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                        )
                      ],
                    ),
                  ),


                  Divider(indent: 10,endIndent: 14,color: Colors.grey,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('SETTINGS',
                      //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                       style: TextStyle(color: Colors.grey.shade700,fontSize: 12)
                    ),
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
                              Text('Language',
                                //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                              )
                            ],

                          ),

                          Container(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: dropdownValue_month,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValue_month = value!;
                                    });
                                  },
                                  items: list_month.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
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
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.dark_mode_sharp),SizedBox(width: 10,),
                          Text('Dark Mode',
                             // style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                          ),Spacer(),
                          Switch(
                              value: _darkTheme,
                              onChanged: (val){
                                setState(() {
                                  _darkTheme = val;
                                });
                                onThemeChanged(val, themeNotifier);

                              })
                        ],
                      )
                  ),


                  Divider(indent: 10,endIndent: 14,color: Colors.grey,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('HELP & LEGAL',
                    //  style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                       style: TextStyle(color: Colors.grey.shade700,fontSize: 12)
                    ),
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
                              return HelpPage();
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.help),SizedBox(width: 10,),
                          Text('Help',
                           // style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                          )
                        ],
                      )
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
                              return AboutUsPage();
                            },
                          ),
                        );


                      },
                      child: Row(
                        children: [
                          Icon(Icons.info_outlined),SizedBox(width: 10,),
                          Text('About Us',

                            //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                          )
                        ],
                      )
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
                              return ContactUs();
                            },
                          ),
                        );


                      },
                      child: Row(
                        children: [
                          Icon(Icons.phone_callback_sharp),SizedBox(width: 10,),
                          Text('Contact Us',
                            //style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                          )
                        ],
                      )
                  ),



                  Divider(indent: 10,endIndent: 14,color: Colors.grey,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('MORE',
                     // style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

                       style: TextStyle(color: Colors.grey.shade700,fontSize: 12)
                    ),
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
                          Text('Rate Us',
                           // style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),


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
                          Icon(Icons.share),SizedBox(width: 10,),
                          Text('Share',
                           // style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

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
                          Icon(Icons.logout),SizedBox(width: 10,),
                          Text('Log out',
                           // style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),

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

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
