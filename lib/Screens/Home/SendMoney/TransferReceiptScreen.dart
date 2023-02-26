import 'package:flutter/material.dart';
import 'package:payments_all_app/Screens/Home/HomePage.dart';
import 'package:payments_all_app/utils/app_layout.dart';

import 'contact_page_send_money.dart';

class TransferReceiptPage extends StatefulWidget {
  const TransferReceiptPage({Key? key}) : super(key: key);

  @override
  State<TransferReceiptPage> createState() => _TransferReceiptPageState();
}

class _TransferReceiptPageState extends State<TransferReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        title: Text('Transfer Receipt',style: TextStyle(color: Colors.black)),
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


                Text('Transfer Success',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),


                SizedBox(height: 10,),


                Text('Your money has been successfully sent to Nayantara V',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16),
                ),


                SizedBox(height: 15,),

                Text('৳1300.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 26),
                ),


                SizedBox(height: 15,),

                Text('Total Transfer',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16),
                ),


                SizedBox(height: 15,),

                Text('- - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 20),
                ),


                SizedBox(height: 15,),


                Text('Recipient',
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
                      title: Text('Kaka'),
                      subtitle: Text('8050530XXX             3:02 PM'),
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


                      child: Text('Done',
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
