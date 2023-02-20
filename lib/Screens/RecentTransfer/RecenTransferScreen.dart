import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTransferScreen extends StatefulWidget {
  const RecentTransferScreen({Key? key}) : super(key: key);

  @override
  State<RecentTransferScreen> createState() => _RecentTransferScreenState();
}

class _RecentTransferScreenState extends State<RecentTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                TextButton(
                    onPressed: (){},
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                Text('All Transfer',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
              ],
            ),


          ],
        ),
      ));
  }
}
