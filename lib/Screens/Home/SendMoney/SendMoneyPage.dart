import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

import 'TransferReceiptScreen.dart';

class SendMoneyPage extends StatelessWidget {
   SendMoneyPage({super.key,  required this.contacts});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class SendMoneyPage extends StatefulWidget {
//   final Contact contacts;
//   const SendMoneyPage({Key? key, required this.contacts}) : super(key: key);
//
//   @override
//   State<SendMoneyPage> createState() => _SendMoneyPageState();
// }

final String contacts;

  // TextEditingController _sendMoney = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back,color: Colors.black,)),
                const Text('Send Money',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text( contacts.isNotEmpty ? contacts : '(none)',
                          style: const TextStyle(fontSize: 20),),
                      ],
                    )),
              ),
            ),
            SizedBox(height: 40,),
             Text(contacts,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),SizedBox(height: 5,),
             Text(contacts.isNotEmpty ? contacts : '(none)',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey)),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 60,width: 296,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                 // controller: _sendMoney,
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
            SizedBox(height: 200,),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TransferReceiptPage();
                          },
                        ),
                      );

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
