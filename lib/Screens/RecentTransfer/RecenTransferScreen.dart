import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payments_all_app/utils/app_layout.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                  Text('All Transections',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                ],
              ),



              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context,int index){

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Pay Bill"),

                          Text("DESCO"),

                          Text("Transaction ID : DEX123546"),

                          Text("12:50 pm, 22/02/2023"),



                        ],
                      ),
                    );

              }),







            ],
          ),
        ),
      ));
  }
}
