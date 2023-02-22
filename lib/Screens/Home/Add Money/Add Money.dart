import 'package:flutter/material.dart';

import 'FromOtherBank/FromOtherBankVisaCardPage.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({Key? key}) : super(key: key);

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                Text('Add Money',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(16.0),
            child: Container(
              height: 200,width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
             // color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(' From Other Bank',style: TextStyle(fontSize: 18,color: Colors.black),),
                  ),
                  Divider(thickness: 2,),
                  TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FromOtherBankVisaCardPage();
                          },
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/VisaCard.png',height: 22,width: 45,),
                        Text('   Other Bank VISA Card',style: TextStyle(fontSize: 16,color: Colors.black)),
                      ],
                    ),
                  ),
                  Divider(indent: 16,endIndent: 18,),
                  TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FromOtherBankVisaCardPage();
                          },
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/MasterCard.png',height: 22,width: 45,),
                        Text('   Other Bank Master Card',style: TextStyle(fontSize: 16,color: Colors.black),),
                      ],
                    ),
                  ),
                  Divider(indent: 16,endIndent: 18,)
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(16.0),
            child: Container(
              height: 200,width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              //color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(' From DBBL',style: TextStyle(fontSize: 18,color: Colors.black),),
                  ),
                  Divider(thickness: 2,),
                  TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FromOtherBankVisaCardPage();
                          },
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/VisaCard.png',height: 22,width: 45,),
                        Text('   DBBL VISA Card',style: TextStyle(fontSize: 16,color: Colors.black)),
                      ],
                    ),
                  ),
                  Divider(indent: 16,endIndent: 18,),
                  TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FromOtherBankVisaCardPage();
                          },
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/MasterCard.png',height: 22,width: 45,),
                        Text('   DBBL Master Card',style: TextStyle(fontSize: 16,color: Colors.black),),
                      ],
                    ),
                  ),
                  Divider(indent: 16,endIndent: 18,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
