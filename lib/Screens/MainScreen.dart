import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payments_all_app/Screens/Home/HomePage.dart';
import 'package:payments_all_app/Screens/Notification/NotificationScreen.dart';
import 'package:payments_all_app/Screens/RecentTransfer/RecenTransferScreen.dart';

import 'Account & Settings/ProfileScreen.dart';
import 'Scan/ScanScreen.dart';

// class MainScreen extends StatefulWidget {
//
//
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class MainScreen extends StatefulWidget {
//
//   final String phoneNumber;
//
//
//   const MainScreen({super.key, required this.phoneNumber});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

class MainScreen extends StatelessWidget {

  final String phoneNumber;
  MainScreen({super.key, required this.phoneNumber});

  RxInt _index = 0.obs;

  List<Widget> pages=[
    const HomePage(),
    const RecentTransferScreen(),
    const ScanScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];



  @override
  Widget build(BuildContext context) {
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
