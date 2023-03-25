import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'QRCode/cashout_qrcode_scanner.dart';
import 'cashout_amount.dart';




class CashOutPage extends StatelessWidget {

  final String pin;
  final String balance;
  final String senderPhoneNumber;

   CashOutPage({super.key, required this.pin,required this.balance, required this.senderPhoneNumber});


  TextEditingController _mobileNo=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Cash Out',
          style: TextStyle(
              color: Colors.black),
        ),
        iconTheme: const IconThemeData(
            color: Colors.black),
        backgroundColor: const Color(0xFFFFF8F8),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Container(
                  height: 80,width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xFFFCDEDE),
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: TextButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CashOutQRCodeScanner();
                          },
                        ),
                      );

                    },
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),


                        Icon(
                          Icons.qr_code_scanner_sharp,
                          size: 30,
                          color: Colors.red.shade300,
                        ),


                        const SizedBox(height: 5,),


                        const Text('Scan QR',
                          style: TextStyle(
                              color: Colors.black),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('   Or'),
              const SizedBox(height: 20,),


              Container(
                height: 180,width: 320,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFFCDEDE),),
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    Text('   Agent Mobile or A/C No',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade900)
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,width: 296,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFFFCDEDE),
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white
                        ),


                        child: TextField(
                          controller: _mobileNo,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.red.shade900,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.account_circle,
                              size: 30,
                              color: Colors.grey,
                            ),
                            hintText: 'Mobile or A/C No',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            suffixIcon: const Icon(
                                Icons.contact_phone_outlined),
                            suffixIconColor: const Color(0xFFFCDEDE),
                          ),
                        ),
                      ),
                    ),




                    const SizedBox(height: 15,),


                    Padding(padding: const EdgeInsets.only(left: 28.0),


                        child: Container(
                          height: 40,width: 260,
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
                              if(_mobileNo.text.isNotEmpty){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CashoutAmount(
                                        agentNumber: _mobileNo.text.toString(),
                                        senderPhoneNumber: senderPhoneNumber,
                                        pin: pin,
                                        balance: balance
                                      );
                                    },
                                  ),
                                );

                              }
                              else
                                {
                                  Fluttertoast.showToast(
                                      msg: "Please enter Agent mobile or A/C number.Thank You! ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 10,
                                      backgroundColor: Colors.red.shade100,
                                      textColor: Colors.black,
                                      fontSize: 16.0
                                  );
                                }


                            },


                            child: const Text('Next',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 16)
                            ),

                          ),
                        )
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
