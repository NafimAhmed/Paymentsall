import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/Home/Bank%20Transfer/Bank%20Transfer.dart';
import 'package:payments_all_app/Screens/Home/Bill%20Pay/BillPay.dart';
import 'package:payments_all_app/Screens/Mobile%20Banking/MobileBankingPage.dart';
import 'package:payments_all_app/Screens/RecentTransfer/RecenTransferScreen.dart';

import '../fuel_pay/fuel_pay_dash_board.dart';
import 'donation/donation_home.dart';
import 'salary_payroll/salary_dash_board.dart';
import 'travelcard_all/tc_form.dart';
import 'Home/Add Money/Add Money.dart';
import 'marchent_pay_all/Merchant Pay.dart';
import 'mobile_recharge_all/Mobile Recharge Page.dart';
import 'Home/Government Fees/GovernmentFeesPage.dart';
import 'Home/SendMoney/SendMoneyPage.dart';
import 'Home/SendMoney/contact_page_send_money.dart';
import 'mobile_recharge_all/contacts_page.dart';
import 'Home/cashout_all/CashOutPage.dart';



class HomePage extends StatelessWidget {

  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String pin;
  final String balance;

  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");

  





  static List offer=[
    Image.network('https://static.vecteezy.com/system/resources/previews/005/405/595/original/special-offer-sale-banner-besign-discount-label-and-sticker-for-media-promotion-product-free-vector.jpg'),
    Image.network('https://static.vecteezy.com/system/resources/previews/005/405/595/original/special-offer-sale-banner-besign-discount-label-and-sticker-for-media-promotion-product-free-vector.jpg'),
    Image.network('https://static.vecteezy.com/system/resources/previews/005/405/595/original/special-offer-sale-banner-besign-discount-label-and-sticker-for-media-promotion-product-free-vector.jpg'),
    Image.network('https://static.vecteezy.com/system/resources/previews/005/405/595/original/special-offer-sale-banner-besign-discount-label-and-sticker-for-media-promotion-product-free-vector.jpg'),
    Image.network('https://static.vecteezy.com/system/resources/previews/005/405/595/original/special-offer-sale-banner-besign-discount-label-and-sticker-for-media-promotion-product-free-vector.jpg'),

  ];

   HomePage({super.key, required this.phoneNumber, required this.firstName, required this.lastName, required this.pin,required this.balance});

  // HomePage({super.key, required this.phoneNumber});




  @override
  Widget build(BuildContext context) {

    RxString? balancechange=balance.obs;

    rf.child(phoneNumber).child('profile').onValue.listen((event) {

      double balan= double.parse(event.snapshot.child("balance").value.toString()!);

      balancechange.value=balan.toStringAsFixed(2);

    });



    return Obx(() => Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/splash2.png',height: 60,width: 60,),
                    Text(' Payments All',
                      style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding:  EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, $firstName $lastName',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),SizedBox(height: 5,),
                        Text('Your available balance',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey)),
                      ],
                    ),Spacer(),
                    Text('৳ ${balancechange}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 16,right: 16,bottom: 10),
                child: Container(
                  height: 74,width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.red.shade900
                  ),
                  child: Row(
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
                                  return MerchantPayPage(
                                    pin: pin,
                                    balance: balancechange.value,
                                    senderNumber: phoneNumber,
                                  );
                                },
                              ),
                            );
                          },
                          child: Column(
                            children:  [
                              //SizedBox(height: 5,),
                              CircleAvatar(
                                  backgroundColor:  Color(0xFFFFF8F8),
                                  radius: 20,
                                  child: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.red.shade900,
                                  ),


                              ),//Image.asset('assets/images/merchant_pay.png',height: 40,width: 40,)),
                              // Icon(Icons.shopping_cart_sharp,color: Colors.white),SizedBox(height: 5,),

                              Text('Merchant Pay',style: TextStyle(color:Colors.white))
                            ],
                          )),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ContactPageSendMoney(
                                pin: pin,
                                SenderPhoneNumber: phoneNumber,
                                balance: balancechange.value,);
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
                              //SizedBox(height: 5,),
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  radius: 20,
                                  child: Icon(Icons.send_and_archive,
                                  color: Colors.red.shade900,
                                  )//Image.asset('assets/images/send_money.png',height: 40,width: 40,)
                              ),
                              // Icon(Icons.send,color: Colors.white,),SizedBox(height: 5,),
                              Text('Send Money',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white))
                            ],
                          )),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CashOutPage(
                                senderPhoneNumber: phoneNumber,
                                pin: pin,
                                balance: balancechange.value,);
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
                              // SizedBox(height: 5,),
                              CircleAvatar(
                                  backgroundColor: Color(0xFFFFF8F8),
                                  radius: 20,
                                  child: Icon(Icons.send_to_mobile,color: Colors.red.shade900,)//Image.asset('assets/images/cash_out.png',height: 35,width: 35,)
                              ),
                              // Icon(Icons.account_balance_wallet_outlined,color: Colors.white,),SizedBox(height: 5,),
                              Text('Cash Out',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Container(
              //     height: 400,width: 350,
              //     //color: Colors.white,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(4.0),
              //         color: Colors.white
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         const SizedBox(height: 10,),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Container(
              //               alignment: Alignment.centerLeft,
              //               child: TextButton(
              //                   style: ButtonStyle(
              //                     shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                     overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                   ),
              //                   onPressed: (){
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) {
              //                           return AddMoneyPage(
              //                             amount: '',
              //                             firstName: firstName,
              //                             lastName: lastName,
              //                             phoneNumber: phoneNumber,
              //                             pin: pin,);
              //                         },
              //                       ),
              //                     );
              //                   },
              //                   child: Column(
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: Color(0xFFFFF8F8),
              //                         child: Icon(
              //                           Icons.install_mobile,
              //                           color: Colors.red.shade900,
              //                         size: 40,
              //                         ),//Image.asset('assets/images/add_money.png',),
              //                         radius: 26,
              //                         //Icon(Icons.account_balance_wallet_sharp,color: Colors.black,)
              //                       ),
              //                       Text('Add Money',style: TextStyle(color:Color(0xFF80140E)))
              //                     ],
              //                   )
              //               ),
              //             ),
              //             TextButton(
              //                 style: ButtonStyle(
              //                   shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                   overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                 ),
              //                 onPressed: (){
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) {
              //                         return ContactsPage(
              //                           pin: pin,
              //                           balance: balancechange.value,
              //                         );
              //                       },
              //                     ),
              //                   );
              //                 },
              //                 child: Column(
              //                   children: [
              //                     CircleAvatar(
              //                       backgroundColor: Color(0xFFFFF8F8),
              //                       radius: 26,
              //                       child: Icon(Icons.perm_phone_msg,
              //                         color: Colors.red.shade900,
              //                         size: 40,
              //
              //                       )//Image.asset('assets/images/money_recharge.png',) ,
              //
              //                     ),
              //                     const Text('Mobile Recharge',style: TextStyle(color:Color(0xFF80140E)))
              //                   ],
              //                 )),
              //             TextButton(
              //                 style: ButtonStyle(
              //                   shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                   overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                 ),
              //                 onPressed: (){
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) {
              //                         return TCForm(
              //                           phoneNumber: phoneNumber,
              //                         );
              //                       },
              //                     ),
              //                   );
              //                 },
              //                 child: Column(
              //                   children: [
              //                     CircleAvatar(
              //                       backgroundColor: Color(0xFFFFF8F8),
              //                       radius: 26,
              //                       child: Icon(Icons.credit_card,
              //                         color: Colors.red.shade900,
              //                         size: 40,
              //
              //                       )//Image.asset('assets/images/Travel card.png',height: 40,) ,
              //
              //                     ),
              //                     const Text('Travel\nCard',style: TextStyle(color:Color(0xFF80140E)))
              //                   ],
              //                 )),
              //           ],
              //         ),
              //         SizedBox( height: 10,),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Container(
              //               alignment: Alignment.centerRight,
              //               child: TextButton(
              //                   style: ButtonStyle(
              //                     shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                     overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                   ),
              //                   onPressed: (){
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) {
              //                           return FuelPayDashBoard(
              //                             phoneNumber: phoneNumber,
              //                           );
              //                         },
              //                       ),
              //                     );
              //                   },
              //                   child: Column(
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: Color(0xFFFFF8F8),
              //                         radius: 26,
              //                         child: Icon(Icons.local_gas_station,
              //                           color: Colors.red.shade900,
              //                           size: 40,
              //                         )//Image.asset('assets/images/Quick Pay.png',),
              //
              //                         //Icon(Icons.receipt_sharp,color: Colors.black)
              //                       ),
              //                       const Text('Fuel Pay',style: TextStyle(color:Color(0xFF80140E)))
              //                     ],
              //                   )
              //               ),
              //             ),
              //
              //             SizedBox(width: 35,),
              //
              //
              //             Container(
              //               //margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
              //               child: TextButton(
              //                   style: ButtonStyle(
              //                     shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                     overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                   ),
              //                   onPressed: (){
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) {
              //                           return BillPayPage(
              //                             firstName: firstName,
              //                             lastName: lastName,
              //                             pin: pin,);
              //                         },
              //                       ),
              //                     );
              //                   },
              //                   child: Column(
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: Color(0xFFFFF8F8),
              //                         radius: 26,
              //                         child: Icon(Icons.receipt,
              //                         color: Colors.red.shade900,
              //                           size: 40,
              //                         )//Image.asset('assets/images/bill_pay.png',),
              //
              //                         //Icon(Icons.receipt_sharp,color: Colors.black)
              //                       ),
              //                       const Text('Bill Pay',style: TextStyle(color:Color(0xFF80140E)))
              //                     ],
              //                   )
              //               ),
              //             ),
              //
              //             SizedBox(width: 15,),
              //
              //
              //             Container(
              //               alignment: Alignment.centerRight,
              //               child: TextButton(
              //                   style: ButtonStyle(
              //                     shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                     overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                   ),
              //                   onPressed: (){
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) {
              //                           return BankTransferPage();
              //                         },
              //                       ),
              //                     );
              //                   },
              //                   child: Column(
              //                     //crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: const Color(0xFFFFF8F8),
              //                         radius: 26,
              //                         child: Icon(Icons.account_balance,
              //                         size: 40,
              //                           color: Colors.red.shade900,
              //                         )//Image.asset('assets/images/bank_transfer.png',),
              //                       ),
              //                        Text('General\nbanking',style: TextStyle(color:Color(0xFF80140E)))
              //                     ],
              //                   )),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 10,),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //
              //           children: [
              //
              //
              //
              //
              //
              //             TextButton(
              //                 style: ButtonStyle(
              //                   shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                   overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                 ),
              //                 onPressed: (){
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) {
              //                         return GovernmentFeesPage(pin: pin,);
              //                       },
              //                     ),
              //                   );
              //                 },
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     CircleAvatar(
              //                       backgroundColor: const Color(0xFFFFF8F8),
              //                       radius: 26,
              //                       child: Icon(Icons.assured_workload,
              //                         size: 40,
              //                         color: Colors.red.shade900,
              //                       )//Image.asset('assets/images/Govt Fees.png',),
              //                     ),
              //                     const Text('Govt. Fees',style: TextStyle(color:Color(0xFF80140E)))
              //                   ],
              //                 )),
              //
              //
              //
              //             TextButton(
              //                 style: ButtonStyle(
              //                   shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                   overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                 ),
              //                 onPressed: (){
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) {
              //                         return MobileBankingPage();
              //                       },
              //                     ),
              //                   );
              //                 },
              //                 child: Column(
              //                   children: [
              //                     CircleAvatar(
              //                       backgroundColor: const Color(0xFFFFF8F8),
              //                       radius: 26,
              //                       child: Icon(Icons.mobile_friendly,
              //                         color: Colors.red.shade900,
              //                         size: 40,
              //
              //                       )//Image.asset('assets/images/mobile Bank.png',),
              //                     ),
              //                     const Text('Mobile Banking',style: TextStyle(color:Color(0xFF80140E)))
              //                   ],
              //                 )),
              //
              //
              //
              //             Container(
              //               alignment: Alignment.centerRight,
              //               child: TextButton(
              //                   style: ButtonStyle(
              //                     shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                     overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                   ),
              //                   onPressed: (){
              //                     // Navigator.push(
              //                     //   context,
              //                     //   MaterialPageRoute(
              //                     //     builder: (context) {
              //                     //       return MobileBankingPage();
              //                     //     },
              //                     //   ),
              //                     // );
              //                   },
              //                   child: Column(
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: const Color(0xFFFFF8F8),
              //                         radius: 26,
              //                         child: Icon(Icons.book_online,
              //                           color: Colors.red.shade900,
              //                           size: 40,
              //
              //                         ),//Image.asset('assets/images/ticket.png',),
              //                       ),
              //                       const Text('Ticketing',style: TextStyle(color:Color(0xFF80140E)))
              //                     ],
              //                   )),
              //             ),
              //
              //
              //
              //             SizedBox(width: 0,),
              //
              //
              //
              //
              //
              //
              //
              //
              //
              //
              //
              //           ],
              //         ),
              //
              //
              //
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             TextButton(
              //                 style: ButtonStyle(
              //                   shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                   overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                 ),
              //                 onPressed: (){
              //
              //
              //
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) {
              //                         return SalaryDashBoard(
              //                           phoneNumber: phoneNumber,
              //                           balance: balancechange.value,
              //                           pin: pin,);
              //                       },
              //                     ),
              //                   );
              //                 },
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     CircleAvatar(
              //                         backgroundColor: const Color(0xFFFFF8F8),
              //                         radius: 26,
              //                         child: Icon(Icons.wallet,
              //                           color: Colors.red.shade900,
              //                           size: 40,
              //                         )//Image.asset('assets/images/Govt Fees.png',),
              //                     ),
              //                     const Text('Salary Pay',style: TextStyle(color:Color(0xFF80140E)))
              //                   ],
              //                 )),
              //             SizedBox(width: 9,),
              //             TextButton(
              //                 style: ButtonStyle(
              //                   shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                   overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                 ),
              //                 onPressed: (){
              //
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) {
              //                         return DonateHome();
              //                       },
              //                     ),
              //                   );
              //
              //                 },
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     CircleAvatar(
              //                         backgroundColor: const Color(0xFFFFF8F8),
              //                         radius: 26,
              //                         child: Icon(Icons.how_to_vote_rounded,
              //                           color: Colors.red.shade900,
              //                           size: 40,
              //                         )//Image.asset('assets/images/Govt Fees.png',),
              //                     ),
              //                     const Text('Donation',style: TextStyle(color:Color(0xFF80140E)))
              //                   ],
              //                 )),
              //
              //             SizedBox(width: 9,),
              //             TextButton(
              //                 style: ButtonStyle(
              //                   shadowColor: MaterialStateProperty.all(Colors.transparent),
              //                   overlayColor: MaterialStateProperty.all(Colors.transparent),
              //                 ),
              //                 onPressed: (){
              //
              //
              //
              //                 },
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     CircleAvatar(
              //                         backgroundColor: const Color(0xFFFFF8F8),
              //                         radius: 26,
              //                         child: SizedBox(width: 40,)//Image.asset('assets/images/Govt Fees.png',),
              //                     ),
              //                     const Text('',style: TextStyle(color:Color(0xFF80140E)))
              //                   ],
              //                 )),
              //           ],
              //         ),
              //
              //
              //
              //
              //
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 410,width: 350,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 16,left: 18,top: 8,bottom: 8),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
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
                                          return AddMoneyPage(
                                            amount: '',
                                            firstName: firstName,
                                            lastName: lastName,
                                            phoneNumber: phoneNumber,
                                            pin: pin,);
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xFFFFF8F8),
                                        child: Icon(
                                          Icons.install_mobile,
                                          color: Colors.red.shade900,
                                          size: 40,
                                        ),//Image.asset('assets/images/add_money.png',),
                                        radius: 26,
                                        //Icon(Icons.account_balance_wallet_sharp,color: Colors.black,)
                                      ),
                                      Text('Add Money',style: TextStyle(color:Color(0xFF80140E)))
                                    ],
                                  )
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
                                        return ContactsPage(
                                          pin: pin,
                                          balance: balancechange.value,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: Icon(Icons.perm_phone_msg,
                                          color: Colors.red.shade900,
                                          size: 40,

                                        )//Image.asset('assets/images/money_recharge.png',) ,

                                    ),
                                    const Text('Mobile Recharge',style: TextStyle(color:Color(0xFF80140E)))
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
                                        return TCForm(
                                          phoneNumber: phoneNumber,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: Icon(Icons.credit_card,
                                          color: Colors.red.shade900,
                                          size: 40,

                                        )//Image.asset('assets/images/Travel card.png',height: 40,) ,

                                    ),
                                    const Text('Travel Card',style: TextStyle(color:Color(0xFF80140E)))
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox( height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 0,left: 24),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
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
                                          return FuelPayDashBoard(
                                            phoneNumber: phoneNumber,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Color(0xFFFFF8F8),
                                          radius: 26,
                                          child: Icon(Icons.local_gas_station,
                                            color: Colors.red.shade900,
                                            size: 40,
                                          )//Image.asset('assets/images/Quick Pay.png',),

                                        //Icon(Icons.receipt_sharp,color: Colors.black)
                                      ),
                                      const Text('Fuel Pay',style: TextStyle(color:Color(0xFF80140E)))
                                    ],
                                  )
                              ),
                            ),

                            SizedBox(width: 36,),


                            Container(
                              //margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
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
                                          return BillPayPage(
                                            firstName: firstName,
                                            lastName: lastName,
                                            pin: pin,);
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Color(0xFFFFF8F8),
                                          radius: 26,
                                          child: Icon(Icons.receipt,
                                            color: Colors.red.shade900,
                                            size: 40,
                                          )//Image.asset('assets/images/bill_pay.png',),

                                        //Icon(Icons.receipt_sharp,color: Colors.black)
                                      ),
                                      const Text('Bill Pay',style: TextStyle(color:Color(0xFF80140E)))
                                    ],
                                  )
                              ),
                            ),

                            SizedBox(width: 15,),


                            Container(
                              alignment: Alignment.centerRight,
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
                                          return BankTransferPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: const Color(0xFFFFF8F8),
                                          radius: 26,
                                          child: Icon(Icons.account_balance,
                                            size: 40,
                                            color: Colors.red.shade900,
                                          )//Image.asset('assets/images/bank_transfer.png',),
                                      ),
                                      Text('General banking',style: TextStyle(color:Color(0xFF80140E)))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 16,left: 24,top: 0,bottom: 8),
                        // padding: const EdgeInsets.only(right: 0,left: 18),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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
                                        return GovernmentFeesPage(pin: pin,);
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: const Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: Icon(Icons.assured_workload,
                                          size: 40,
                                          color: Colors.red.shade900,
                                        )//Image.asset('assets/images/Govt Fees.png',),
                                    ),
                                    const Text('Govt. Fees',style: TextStyle(color:Color(0xFF80140E)))
                                  ],
                                )),

                            SizedBox(width: 2,),


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
                                        return MobileBankingPage();
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: const Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: Icon(Icons.mobile_friendly,
                                          color: Colors.red.shade900,
                                          size: 40,

                                        )//Image.asset('assets/images/mobile Bank.png',),
                                    ),
                                    const Text('Mobile Banking',style: TextStyle(color:Color(0xFF80140E)))
                                  ],
                                )),

                            SizedBox(width: 15,),


                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                  ),
                                  onPressed: (){
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return MobileBankingPage();
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: const Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: Icon(Icons.book_online,
                                          color: Colors.red.shade900,
                                          size: 40,

                                        ),//Image.asset('assets/images/ticket.png',),
                                      ),
                                      const Text('Ticketing',style: TextStyle(color:Color(0xFF80140E)))
                                    ],
                                  )),
                            ),



                            SizedBox(width: 0,),











                          ],
                        ),
                      ),



                      Padding(
                        // padding: const EdgeInsets.only(right: 0,left: 18),
                        padding: const EdgeInsets.only(right: 16,left: 25,top: 0,bottom: 8),
                        child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        return SalaryDashBoard(
                                          phoneNumber: phoneNumber,
                                          balance: balancechange.value,
                                          pin: pin,);
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: const Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: Icon(Icons.wallet,
                                          color: Colors.red.shade900,
                                          size: 40,
                                        )//Image.asset('assets/images/Govt Fees.png',),
                                    ),
                                    const Text('Salary Pay',style: TextStyle(color:Color(0xFF80140E)))
                                  ],
                                )),
                            SizedBox(width: 30,),
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
                                        return DonateHome();
                                      },
                                    ),
                                  );

                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: const Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: Icon(Icons.how_to_vote_rounded,
                                          color: Colors.red.shade900,
                                          size: 40,
                                        )//Image.asset('assets/images/Govt Fees.png',),
                                    ),
                                    const Text('Donation',style: TextStyle(color:Color(0xFF80140E)))
                                  ],
                                )),

                            SizedBox(width: 34,),

                            TextButton(
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                                ),
                                onPressed: (){



                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: const Color(0xFFFFF8F8),
                                        radius: 26,
                                        child: SizedBox(width: 40,)//Image.asset('assets/images/Govt Fees.png',),
                                    ),
                                    const Text('',style: TextStyle(color:Color(0xFF80140E)))
                                  ],
                                )),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,)



                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text('Offers',
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10,),
                child: Container(
                  height: 100,width: 350,
                  //color: Colors.pinkAccent.shade100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: offer.length,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          child: offer[index],
                        );
                      }

                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10),
                child: Container(
                  height: 130,width: 350,
                  //color: Colors.grey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Recent Transaction',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),Spacer(),
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
                                      return RecentTransferScreen(
                                        phoneNumber: phoneNumber,
                                      );
                                    },
                                  ),
                                );

                              }, child: Text('See All',style: TextStyle(fontWeight: FontWeight.w500,color:Colors.red.shade900)))
                        ],
                      ),
                      const Card(
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Color(0xFFFFF8F8),
                              child: Icon(Icons.account_balance_wallet_rounded,color: Colors.black,)),
                          title: Text('Aviroop',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                          subtitle: Text('February 24,2022'),
                          trailing: Text('৳240.00',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                        ),
                      )
                    ],
                  ),

                ),

              )
            ],
          ),
        ),
      ),
    ) );


  }








}
