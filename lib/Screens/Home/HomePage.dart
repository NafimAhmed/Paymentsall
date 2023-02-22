import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payments_all_app/Screens/Home/Bank%20Transfer/Bank%20Transfer.dart';
import 'package:payments_all_app/Screens/Home/BillPay.dart';

import 'Add Money/Add Money.dart';
import 'CashOutPage.dart';
import 'Merchant Pay.dart';
import 'Mobile Recharge Page.dart';
import 'SendMoneyPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png',height: 50,width: 50,),
                  Text('Payment All',
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.red.shade900),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi, Nafim Ahmed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),SizedBox(height: 5,),
                      Text('Your available balance',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey)),
                    ],
                  ),Spacer(),
                  Text('4,590.00',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,))
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16,right: 16,bottom: 10),
            child: Container(
              height: 70,width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.red.shade900
              ),
              // color: Colors.red.shade900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){},
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Column(
                        children: [
                        SizedBox(height: 5,),
                          Icon(Icons.add_circle_outline_sharp,color: Colors.white,),SizedBox(height: 5,),
                          Text('Top Up',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white))
                        ],
                      )),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SendMoneyPage();
                        },
                      ),
                    );
                  },
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Column(
                        children: [
                        SizedBox(height: 5,),
                          Icon(Icons.send,color: Colors.white,),SizedBox(height: 5,),
                          Text('Send Money',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white))
                        ],
                      )),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CashOutPage();
                        },
                      ),
                    );

                  },
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Column(
                        children: [
                        SizedBox(height: 5,),
                          Icon(Icons.account_balance_wallet_outlined,color: Colors.white,),SizedBox(height: 5,),
                          Text('Cash Out',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white))
                        ],
                      )),
                ],
              ),
            ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
            child: Container(
              height: 190,width: 350,
              //color: Colors.white,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                                  return AddMoneyPage();
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  child: Icon(Icons.account_balance_wallet_sharp,color: Colors.black,)),
                              Text('Add Money',style: TextStyle(color:Colors.black))
                            ],
                          )),
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
                                  return MobileRechargePage();
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  child: Icon(Icons.phonelink_ring_sharp,color: Colors.black,)),
                              Text('Mobile Recharge',style: TextStyle(color:Colors.black))
                            ],
                          )),
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
                                  return BillPayPage();
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  child: Icon(Icons.receipt_sharp,color: Colors.black)),
                              Text('Bill Pay',style: TextStyle(color:Colors.black))
                            ],
                          )),
                    ],
                  ),
                  SizedBox( height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                                  return BankTransferPage();
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  child: Icon(Icons.mobile_screen_share_rounded,color: Colors.black)),
                              Text('Bank Transfer',style: TextStyle(color:Colors.black))
                            ],
                          )),
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
                                  return MerchantPayPage();
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                  child: Icon(Icons.shopping_cart_sharp,color: Colors.black),
                              backgroundColor: Color(0xFFFFF8F8),),
                              Text('Merchant Pay',style: TextStyle(color:Colors.black))
                            ],
                          )),

                      // TextButton(
                      //     style: ButtonStyle(
                      //       shadowColor: MaterialStateProperty.all(Colors.transparent),
                      //       overlayColor: MaterialStateProperty.all(Colors.transparent),
                      //     ),
                      //     onPressed: (){},
                      //     child: Column(
                      //       children: [
                      //         Icon(Icons.home,color: Colors.black),
                      //         Text('Rent Bill',style: TextStyle(color:Colors.black))
                      //       ],
                      //     )),
                      // TextButton(
                      //     style: ButtonStyle(
                      //       shadowColor: MaterialStateProperty.all(Colors.transparent),
                      //       overlayColor: MaterialStateProperty.all(Colors.transparent),
                      //     ),
                      //     onPressed: (){},
                      //     child: Column(
                      //       children: [
                      //         Icon(Icons.leaderboard_sharp,color: Colors.black),
                      //         Text('Invest',style: TextStyle(color:Colors.black))
                      //       ],
                      //     )),
                      // TextButton(
                      //     style: ButtonStyle(
                      //       shadowColor: MaterialStateProperty.all(Colors.transparent),
                      //       overlayColor: MaterialStateProperty.all(Colors.transparent),
                      //     ),
                      //     onPressed: (){},
                      //     child: Column(
                      //       children: [
                      //         Icon(Icons.more_sharp,color: Colors.black),
                      //         Text('More',style: TextStyle(color:Colors.black))
                      //       ],
                      //     )),
                    ],
                  ),
                ],
              ),
            ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16,right: 16,bottom: 10,),
            child: Container(
              height: 100,width: 350,color: Colors.pinkAccent.shade100,
              // child: ,
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 16,right: 16,bottom: 10),
              child: Container(
                height: 130,width: 350,
                //color: Colors.grey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Recent Transaction',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),Spacer(),
                        TextButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: (){}, child: Text('See All',style: TextStyle(fontWeight: FontWeight.w500,color:Colors.red.shade900)))
                      ],
                    ),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFFFF8F8),
                            child: Icon(Icons.account_balance_wallet_rounded,color: Colors.black,)),
                        title: Text('Aviroop',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                        subtitle: Text('February 24,2022'),
                        trailing: Text('240.00',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                      ),
                    )
                  ],
                ),

              ),

            )
          ],
        ),
      ),
    );
  }
}
