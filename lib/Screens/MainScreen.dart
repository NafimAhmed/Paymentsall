import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payments_all_app/Screens/HomePage.dart';
import 'package:payments_all_app/Screens/Notification/NotificationScreen.dart';
import 'package:payments_all_app/Screens/RecentTransfer/RecenTransferScreen.dart';

import 'Account & Settings/ProfileScreen.dart';
import 'Scan/ScanScreen.dart';


class MainScreen extends StatelessWidget {

  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String pin;
  final String gender;
  final String dob;
  final String balance;
  //MainScreen({super.key, required this.phoneNumber});

  /////////////////////////////////////




  /////////////////////////////////////






  RxInt _index = 0.obs;

  MainScreen({super.key, required this.phoneNumber, required this.firstName, required this.lastName,required this.pin,required this.balance, required this.gender, required this.dob});





  @override
  Widget build(BuildContext context) {

    //String numb=phoneNumber;

    List<Widget> pages=[
      HomePage(
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        pin: pin,
        balance: balance,
      ),
      RecentTransferScreen(
        phoneNumber: phoneNumber,
      ),
      ScanScreen(phonenumber: phoneNumber,),
      NotificationScreen(phoneNumber: phoneNumber,),
      ProfileScreen(
        first_name: firstName,
        last_name: lastName,
        number: phoneNumber,
        gender: gender,
        dob: dob,
      )
    ];



    return Obx(() => Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: pages[_index.value],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFFFFF8F8),
        currentIndex: _index.value,
        onTap: (value){
          _index.value=value;
          // setState(() {
          //   _index=value;
          // });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_sharp),
              label: ''),
          BottomNavigationBarItem(icon: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.qr_code_2_rounded,color: Colors.white,)),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_sharp),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),
              label: ''),
        ],
      ),
    ));





  }
}
