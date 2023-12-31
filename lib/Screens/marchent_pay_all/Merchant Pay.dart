import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:payments_all_app/Screens/marchent_pay_all/QRCode/marchent_pay_qrcode_scanner.dart';

import 'marchent_pay_amount.dart';

class MerchantPayPage extends StatefulWidget {

  final String senderNumber;
  final String pin;
  final String balance;

  const MerchantPayPage({super.key, required this.pin,required this.balance, required this.senderNumber});

  @override
  State<MerchantPayPage> createState() => _MerchantPayPageState();
}

class _MerchantPayPageState extends State<MerchantPayPage> {
  TextEditingController _mobileNo=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Merchant Pay',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),
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
                    border: Border.all(width: 1,color: const Color(0xFFFCDEDE),),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,MaterialPageRoute(
                        builder: (context) {
                          return MarchentPayQRCodeScanner();},),);

                    },
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Icon(Icons.qr_code_scanner_sharp,size: 30,color: Colors.red.shade300,),
                        SizedBox(height: 5,),
                        Text('Scan QR',style: TextStyle(color: Colors.black),)
                      ],
                    ),

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('   Or'),
              SizedBox(height: 20,),
              Container(
                height: 180,width: 320,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: const Color(0xFFFCDEDE),),
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    //Text('   Merchant or A/C No'),
                    Text('   Merchant Mobile or A/C No',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,width: 296,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white
                        ),
                        child: TextField(
                          controller: _mobileNo,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.red.shade900,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.grey,),
                            hintText: 'Mobile or A/C No',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            suffixIcon: Icon(Icons.contact_phone_outlined),
                            suffixIconColor: Color(0xFFFCDEDE),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(padding: EdgeInsets.only(left: 28.0),
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
                                      return MarchentPayAmount(
                                        reveiverNumb: _mobileNo.text.toString(),
                                        pin: widget.pin,
                                         balance: widget.balance,
                                        senderNumber: widget.senderNumber,);
                                    },
                                  ),
                                );

                              }
                              else
                                {
                                  Fluttertoast.showToast(
                                      msg: "Please enter Merchant mobile or A/C number.Thank You! ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 10,
                                      backgroundColor: Colors.red.shade100,
                                      textColor: Colors.black,
                                      fontSize: 16.0
                                  );
                                }

                            },
                            child: Text('Next',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
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
