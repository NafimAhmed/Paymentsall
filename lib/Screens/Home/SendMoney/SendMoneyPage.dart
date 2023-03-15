import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Send_money_Pin_page.dart';
import 'TransferReceiptScreen.dart';

// class SendMoneyPage extends StatelessWidget {
//    SendMoneyPage({super.key,  required this.contacts});
//
// final String contacts;
//
//   final FocusNode _textFocusNode = FocusNode();
//


class SendMoneyPage extends StatefulWidget {
  final String contacts,name,pin,balance;
  const SendMoneyPage({super.key, required this.contacts, required this.name, required this.pin, required this.balance});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {

  TextEditingController _sendMoney=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Send Money',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Colors.red.shade300,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.red.shade100
                  ),
                  height: 150,width: 330,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // SizedBox(height: 1,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,top: 0,bottom: 8),
                        child: Text('Receiver :',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Colors.black)
                  ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8,bottom: 12),
                        child: Container(
                          height: 50,width: 280,
                            decoration: BoxDecoration(
                                //border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                               // Text( contacts.isNotEmpty ? contacts : '(none)',
                          Text( "${widget.contacts!.isNotEmpty ? widget.contacts : '(none)'}",
                            style: const TextStyle(fontSize: 20),),

                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           // SizedBox(height: 20,),
            // Text(contacts,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),SizedBox(height: 5,),
            // Text(contacts.isNotEmpty ? contacts : '(none)',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey)),
            //SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.red.shade100
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,top: 0,bottom: 30),
                        child: Text('Send Amount :',style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Colors.black)
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 0,bottom: 12),
                        //padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 50,width: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white
                          ),
                          child: TextField(
                            controller: _sendMoney,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.red.shade900,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Amount',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 26),
                        child: Text('Available Balance : 1000.00 ৳',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 150,),
            Padding(padding: EdgeInsets.only(left: 6),
                child: Container(
                  height: 40,width: 270,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.red.shade900
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      if(_sendMoney.text.isNotEmpty){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SendMoneyPinPage(
                                pin: widget.pin,
                                balance: widget.balance,
                                contacts: widget.contacts,
                                name: widget.name,
                                amount: _sendMoney.text.toString(),);
                              //TransferReceiptPage(recNumb: widget.contacts, recName: widget.name, recAmount: _sendMoney.text.toString(),);
                            },
                          ),
                        );
                      }
                      else
                      {
                        Fluttertoast.showToast(
                            msg: "Please enter your amount.Thank You! ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 10,
                            backgroundColor: Colors.red.shade100,
                            textColor: Colors.black,
                            fontSize: 16.0
                        );
                      }

                    },
                    child: Text('Send',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
