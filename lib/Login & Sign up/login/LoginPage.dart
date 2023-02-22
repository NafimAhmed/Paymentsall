import 'package:flutter/material.dart';

import '../../Screens/Home/HomePage.dart';
import '../../Screens/MainScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobileNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',height: 40,width: 50,),
                Text('Payment All',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.red.shade900),textAlign: TextAlign.center,),
              ],
            ),
            Image.asset('assets/images/Login_logo.png'),SizedBox(height: 15,),
            Text('    Enter Validate mobile number for Login',
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade600),textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Text('Mobile Number',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17,color: Colors.black),),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 300,
              margin: EdgeInsets.only(left: 30),
              child: TextFormField(
                controller: _mobileNumber,
                textInputAction: TextInputAction.none,
                cursorColor: Colors.black,
                onSaved: (mobile){},
                decoration: InputDecoration(
                  prefixText: '+88   ',
                  prefixStyle: TextStyle( fontSize: 19,color: Colors.black,fontWeight: FontWeight.w500),
                  hintText: '01XXXXXXXXX',
                  hintStyle: TextStyle( fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w400),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200)
                  )
                ),

              ),
            ),
             SizedBox(height: 20,),
            Container(
              height: 40,width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.deepOrange.shade50
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
                        return MainScreen();
                      },
                    ),
                  );
              },
                child: Text('Login',
                style: TextStyle(fontSize: 20,color: Colors.red.shade900),),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('  By proceeding you agree to our',
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.grey.shade500),
                  textAlign: TextAlign.center,),
                TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){},
                    child: Text('Terms and Conditions'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
