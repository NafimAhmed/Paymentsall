import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'FromOtherBankVisaCardInfo.dart';

class FromOtherBankVisaCardPage extends StatefulWidget {
  const FromOtherBankVisaCardPage({Key? key}) : super(key: key);

  @override
  State<FromOtherBankVisaCardPage> createState() => _FromOtherBankVisaCardPageState();
}

class _FromOtherBankVisaCardPageState extends State<FromOtherBankVisaCardPage> {
  final TextEditingController _mobileNumber=TextEditingController();
  final TextEditingController _name=TextEditingController();
  final TextEditingController _amount=TextEditingController();

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
          Padding(padding: EdgeInsets.all(10.0),
            child: Container(
              height: 430,width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Text('To Account',style: TextStyle(fontWeight: FontWeight.w500)),SizedBox(width: 30,),
                        RoundCheckBox(
                          onTap: (selected ) {},
                          checkedWidget: Icon(Icons.circle,size: 13,color: Colors.red),
                          borderColor: Colors.red,
                          checkedColor: Colors.white,
                          isChecked: true,
                          size: 18,
                        ),SizedBox(width: 10,),
                        Text('Self',style: TextStyle(fontWeight: FontWeight.w400)),SizedBox(width: 40,),
                        RoundCheckBox(
                          onTap: (selected ) {},
                          checkedWidget: Icon(Icons.circle,size: 13,color: Colors.red),
                          borderColor: Colors.red,
                          checkedColor: Colors.white,
                          isChecked: true,
                          size: 18,
                        ),SizedBox(width: 10,),
                        Text('Other',style: TextStyle(fontWeight: FontWeight.w400)),SizedBox(width: 30,),
                      ],
                    ),
                  ),
                  Divider(indent: 20,endIndent: 22,thickness: 1,),
                  SizedBox(height: 14,),
                  Text('      Mobile or A/C No'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 40,width: 282,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: TextField(
                            controller: _mobileNumber,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.grey,),
                              hintText: 'Mobile Number or A/C No',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14,),
                  Text('      Recipient Name'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 40,width: 282,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: TextField(
                            controller: _name,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '    Name',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14,),
                  Text('      Amount'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 40,width: 282,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: TextField(
                            controller: _amount,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.attach_money_rounded,size: 30,color: Colors.grey,),
                              hintText: 'Amount',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(16.0),
                      child: Container(
                        height: 50,width: 296,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 1,color:),
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.red.shade900
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 110,),
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
                                      return FromOtherBankVisaCardInfo();
                                    },
                                  ),
                                );
                              },
                              child: Text('Next',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                            ),
                            SizedBox(width: 90,),
                            Icon(Icons.arrow_forward,color: Colors.white,)
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
