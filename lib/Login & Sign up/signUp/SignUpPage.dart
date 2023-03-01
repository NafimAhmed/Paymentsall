import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payments_all_app/utils/app_layout.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // File? image;
  String _imagepath='';
  final ImagePicker imgpicker = ImagePicker();

  Future pickImageGallery() async {
    try {
      XFile? pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imagepath = pickedFile.path;
        });
      } else {
        print("No image is selected.");
      }
    } on PlatformException catch (e) {
      print("error while picking image.");
    }
  }
  Future pickImageCamera() async {
    try {
      XFile? pickedFile = await imgpicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _imagepath = pickedFile.path;
        });
      } else {
        print("No image is selected.");
      }
    } on PlatformException catch (e) {
      print("error while picking image.");
    }
  }



  @override
  Widget build(BuildContext context) {
    TextEditingController _firstName=TextEditingController();
    TextEditingController _lastName=TextEditingController();
    TextEditingController _nid=TextEditingController();
    TextEditingController _mobileNumber=TextEditingController();
    TextEditingController _dob=TextEditingController();
    TextEditingController _gender=TextEditingController();
    TextEditingController _pin=TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(


        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getHeight(20),
            vertical: AppLayout.getWidth(20)
        ),


        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),


              Center(
                child: Container(
                  height: AppLayout.getHeight(180),
                  width: AppLayout.getWidth(300),

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(_imagepath)),
                      fit: BoxFit.fill
                    ),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFFCDEDE),
                      ),
                      borderRadius: BorderRadius.circular(4.0),

                      color: Colors.white
                  ),


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: (){
                          pickImageGallery();
                          },
                        child: Text('Upload Picture',
                        style: GoogleFonts.openSans(
                          color: Colors.red.shade300
                        ),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: (){
                          pickImageCamera();
                          },
                        child: Text('Take Picture',
                        style: GoogleFonts.openSans(
                          color: Colors.red.shade300
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 5,),

              Text('   NID No.',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: _nid,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.credit_card_sharp,size: 20,color: Colors.grey,),
                      hintText: 'NID No',
                      hintStyle: TextStyle(color: Colors.grey.shade400),

                    ),
                  ),
                ),
              ),

              Text('   First Name',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: _firstName,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.account_circle,size: 24,color: Colors.grey,),
                      hintText: 'First Name',
                      hintStyle: TextStyle(color: Colors.grey.shade400),

                    ),
                  ),
                ),
              ),



              Text('   Last Name',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: _lastName,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.account_circle,size: 24,color: Colors.grey,),
                      hintText: 'Last Name',
                      hintStyle: TextStyle(color: Colors.grey.shade400),

                    ),
                  ),
                ),
              ),


              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('   Date Of Birth',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          height: 40,width: 148,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: TextField(
                            controller: _dob,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.date_range_sharp,size: 24,color: Colors.grey,),
                              hintText: 'Date of Birth',
                              hintStyle: TextStyle(color: Colors.grey.shade400),

                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('   Gender',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          height: 40,width: 146,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: TextField(
                            controller: _gender,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.man,size: 24,color: Colors.grey,),
                              hintText: 'Gender',
                              hintStyle: TextStyle(color: Colors.grey.shade400),

                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),


             // SizedBox(height: 5,),
              Text('   Mobile Number',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: _mobileNumber,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.mobile_friendly_sharp,size: 24,color: Colors.grey,),
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(color: Colors.grey.shade400),

                    ),
                  ),
                ),
              ),


             // SizedBox(height: 5,),
              Text('   PIN',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: _pin,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.pin,size: 24,color: Colors.grey,),
                      hintText: 'PIN',
                      hintStyle: TextStyle(color: Colors.grey.shade400),

                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Container(
                  height: 40,width: 150,
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

                    },
                    child: Text('Sign Up',
                      style: TextStyle(fontSize: 20,color: Colors.red.shade900),),
                  ),
                ),
              ),




            ],
          ),
        )
      ),

    );
  }
}
