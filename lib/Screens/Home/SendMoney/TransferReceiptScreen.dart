import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payments_all_app/Screens/Home/HomePage.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'contact_page_send_money.dart';

class TransferReceiptPage extends StatelessWidget {

  final String recNumb,recName,recAmount;
  DateTime now = DateTime.now();
   TransferReceiptPage({super.key, required this.recNumb, required this.recName, required this.recAmount});



  @override
  Widget build(BuildContext context) {

    return Scaffold(



      appBar: AppBar(
        title: const Text('Transfer Receipt',style: TextStyle(color: Colors.black)),
        elevation: 0.0,
        backgroundColor: Color(0xFFFFF8F8),
        iconTheme: const IconThemeData(color: Colors.black),
      ),


      backgroundColor: Color(0xFFFFF8F8),


      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),


          child: Container(
            height: AppLayout.getScreenHeight(),
            width: AppLayout.getScreenWidth(),
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: const Color(0xFFFCDEDE),),
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Image.asset('assets/images/successful_transfer.png',
                  height: 200,
                  width: 250,),


                const Text('Transfer Success',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),


                const SizedBox(height: 10,),


                const Text('Your money has been successfully sent to ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16),
                ),
                SizedBox(height: 10,),
                Text(recName.isEmpty ? recNumb : recName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20),
                ),


                const SizedBox(height: 15,),

                Text('৳$recAmount.00',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 26),
                ),


                const SizedBox(height: 15,),

                const Text('Total Transfer',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16),
                ),


                const SizedBox(height: 15,),

                Text('- - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 20),
                ),


                const SizedBox(height: 15,),


                const Text('Recipient',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16),
                ),



                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.grey.shade200,
                    ),


                    child: ListTile(
                     // title: Text("     ${widget.contacts!.isNotEmpty ? widget.contacts : '(none)'}"),
                      title: Text(recName.isEmpty ? 'Unknown' : recName,style: const TextStyle(
                        fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                      ),
                      subtitle: Text('$recNumb     ${DateFormat.yMd().format(now).toString()}   ${DateFormat.jm().format(now).toString()}'),
                    ),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 40,width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
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
                              return HomePage();
                            },
                          ),
                        );
                      },


                      child: const Text('Done',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white),),
                    ),
                  ),
                ),
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
                            return ContactPageSendMoney();
                          },
                        ),
                      );
                    },


                    child: Text('Transfer more money',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.red.shade900,
                          fontSize: 16),
                    ))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
