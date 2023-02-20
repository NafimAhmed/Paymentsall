import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _fullName=TextEditingController();
    TextEditingController _email=TextEditingController();
    TextEditingController _mobileNumber=TextEditingController();
    TextEditingController _address=TextEditingController();
    TextEditingController _zip=TextEditingController();
    TextEditingController _city=TextEditingController();
    TextEditingController _country=TextEditingController();
    return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Form(
      //     // child: Column(
      //     //   children: [
      //     //     TextFormField(
      //     //       controller: _fullName,
      //     //       textInputAction: TextInputAction.next,
      //     //     ),
      //     //     TextFormField(
      //     //       controller: _email,
      //     //     ),
      //     //     TextFormField(
      //     //       controller: _mobileNumber,
      //     //     ),
      //     //     TextFormField(
      //     //       controller: _address,
      //     //     ),
      //     //     TextFormField(
      //     //       controller: _zip,
      //     //     ),
      //     //     TextFormField(
      //     //       controller: _city,
      //     //     ),
      //     //     TextFormField(
      //     //       controller: _country,
      //     //     ),
      //     //   ],
      //     // ),
      //   ),
      // ),
    );
  }
}
