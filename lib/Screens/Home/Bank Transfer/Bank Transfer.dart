import 'package:flutter/material.dart';
import 'BankTransferSubPage/DBBLACpage.dart';
import 'BankTransferSubPage/LinkedACpage.dart';
import 'BankTransferSubPage/OthersBankACpage.dart';

class BankTransferPage extends StatefulWidget {
  const BankTransferPage({Key? key}) : super(key: key);

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text('Bank Transfer',style: TextStyle(color: Colors.black),),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFFFF8F8),
         // bottomOpacity: 0.0,
          elevation: 0.0,
          bottom: TabBar(
            indicatorColor: Colors.red.shade900,
            padding: EdgeInsets.all(4.0),
            isScrollable: false,
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text('Linked A/C',style: TextStyle(color: Colors.black),),
                  ),
                ),
                Tab(
                  child: Container(
                    
                    child: Text('DBBL A/C',style: TextStyle(color: Colors.black),),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Other Bank A/C',style: TextStyle(color: Colors.black),),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            LinkedACpage(),
            DBBLacPage(),
            OthersBankACpage(),
          ],
        ),
       ),

    );
  }
}
