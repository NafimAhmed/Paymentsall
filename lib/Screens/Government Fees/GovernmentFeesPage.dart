import 'package:flutter/material.dart';

import 'Sub Government fees/AIT Page.dart';
import 'Sub Government fees/VAT Page.dart';

class GovernmentFeesPage extends StatefulWidget {
  const GovernmentFeesPage({Key? key}) : super(key: key);

  @override
  State<GovernmentFeesPage> createState() => _GovernmentFeesPageState();
}

class _GovernmentFeesPageState extends State<GovernmentFeesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text('Government Fees',style: TextStyle(color: Colors.black),),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFFFF8F8),
          elevation: 0.0,
          bottom: TabBar(
              indicatorColor: Colors.red.shade900,
              padding: EdgeInsets.all(4.0),
              isScrollable: false,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tab(
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset('assets/images/ait.png',height: 30,),
                          SizedBox(width: 10,),
                          Text('AIT',style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tab(
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset('assets/images/vat.png',height: 30,),
                          SizedBox(width: 10,),
                          Text('VAT',style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            AITpage(),
            VATpage(),
          ],
        ),
      ),

    );

  }
}
