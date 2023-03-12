import 'package:flutter/material.dart';

class MobileBankingPage extends StatefulWidget {
  const MobileBankingPage({Key? key}) : super(key: key);

  @override
  State<MobileBankingPage> createState() => _MobileBankingPageState();
}

class _MobileBankingPageState extends State<MobileBankingPage> {

  String BankingType='Bkash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFF8F8),

          title: Text('Mobile Banking',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Mobile Banking From: ",

                  style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900,fontSize: 18)
              ),
            ),

            Container(
              height: 170,width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    title: Text("Bkash"),
                    value: "Bkash",
                    groupValue: BankingType,
                    onChanged: (value){
                      setState(() {
                        BankingType = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("Nagad"),
                    value: "Nagad",
                    groupValue: BankingType,
                    onChanged: (value){
                      setState(() {
                        BankingType = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Others"),
                    value: "Others",
                    groupValue: BankingType,
                    onChanged: (value){
                      setState(() {
                        BankingType = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
