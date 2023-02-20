import 'package:flutter/material.dart';
import 'package:payments_all_app/Screens/Home/HomePage.dart';
import 'package:payments_all_app/Screens/Notification/NotificationScreen.dart';
import 'package:payments_all_app/Screens/Profile/ProfileScreen.dart';
import 'package:payments_all_app/Screens/RecentTransfer/RecenTransferScreen.dart';

import 'Scan/ScanScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  List<Widget> pages=[
    const HomePage(),
    const RecentTransferScreen(),
    const ScanScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
     body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFFFFF8F8),
        currentIndex: _index,
        onTap: (value){
          setState(() {
            _index=value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_sharp),
          label: ''),
          BottomNavigationBarItem(icon: CircleAvatar(
            backgroundColor: Colors.black,
              child: Icon(Icons.qr_code_scanner_sharp)),
          label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_sharp),
          label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: ''),
        ],
      ),
    );
  }
}
