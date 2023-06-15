import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Screens/HomePage.dart';
import '../../Screens/MainScreen.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobileNumber = TextEditingController();

  TextEditingController _password = TextEditingController();

  ///////////////////////////////////


  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");

  //////////////////////////////

  bool _isObscure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),



      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Payments_All.png',height: 40,width: 50,),
                  Text('Payments All',
                    style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic),),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/Login_logo.png'),
            ),


            SizedBox(height: 20,),


            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Text('Enter validate mobile Number and\nPassword for Login',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade600),textAlign: TextAlign.center,),
            ),


            SizedBox(height: 10,),

            Padding(
                padding: EdgeInsets.all(8.0),
            child: Container(
              height: 280,width: 320,
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  SizedBox(height: 14,),
                  Text('   Mobile Number',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


                  Container(
                    padding: EdgeInsets.fromLTRB(10,10,10,0),
                    child: TextField(
                      maxLength: 11,
                      controller: _mobileNumber,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.account_circle,
                          size: 30,
                          color: Colors.grey,),

                          suffixIcon: Icon(Icons.contact_phone_outlined),
                          suffixIconColor: Color(0xFFFCDEDE),


                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                          ),

                          hintText: "Mobile Number",

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red.shade900,
                                  width: 1.0
                              )
                          )
                      ),
                    ),
                  ),


                  Text('   Password',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: TextField(

                      controller: _password,
                      obscureText: _isObscure,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_sharp,size: 30,color: Colors.grey,),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                            onPressed: (){
                              setState(() {
                                _isObscure= !_isObscure;
                              });
                            },
                          ),
                          suffixIconColor: Color(0xFFFCDEDE),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1,color: Colors.red.shade100)

                    ),

                    hintText: "Password",

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.red.shade900,
                            width: 1.0
                        )
                    )
                    ),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Container(
                      height: 45,width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.deepOrange.shade50
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: ()async{

                          if(_mobileNumber.text.isNotEmpty)
                            {

                              final snapshot = await rf.child(_mobileNumber.text.toString()).child("profile").child("pin").get();
                              final snapshotfnm = await rf.child(_mobileNumber.text.toString()).child("profile").child("first_name").get();
                              final snapshotlnm = await rf.child(_mobileNumber.text.toString()).child("profile").child("last_name").get();
                              final snapshotgnm = await rf.child(_mobileNumber.text.toString()).child("profile").child("gender").get();
                              final snapshotdnm = await rf.child(_mobileNumber.text.toString()).child("profile").child("dob").get();
                              final snapshotBalance = await rf.child(_mobileNumber.text.toString()).child("profile").child("balance").get();

                              if (snapshot.exists) {


                                if(snapshot.value.toString()==_password.text.toString()){

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MainScreen(
                                          phoneNumber: _mobileNumber.text.toString(),
                                          pin: snapshot.value.toString(),
                                          firstName: snapshotfnm.value.toString(),
                                          lastName: snapshotlnm.value.toString(),
                                          balance: snapshotBalance.value.toString(),
                                          gender: snapshotgnm.value.toString(),
                                          dob: snapshotdnm.value.toString(),
                                        );
                                      },
                                    ),
                                  );

                                }
                                else{
                                  Fluttertoast.showToast(
                                      msg: "wrong password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }




                              } else {

                                Fluttertoast.showToast(
                                    msg: "No Account found",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );


                              }








                            }

                          else{

                            Fluttertoast.showToast(
                                msg: "Please enter Valied Phone Number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );

                          }


                                                 },
                        child: Text('Login',
                          style: TextStyle(fontSize: 20,color: Colors.red.shade900),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),


          ],
        ),
      ),
    );
  }
}
