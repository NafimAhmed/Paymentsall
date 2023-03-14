import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/Screens/Government%20Fees/GovernmentFeesPage.dart';
import 'package:payments_all_app/Screens/Home/Bank%20Transfer/Bank%20Transfer.dart';
import 'package:payments_all_app/Screens/Home/Bill%20Pay/BillPay.dart';
import 'package:payments_all_app/Screens/Mobile%20Banking/MobileBankingPage.dart';
import 'package:payments_all_app/Screens/RecentTransfer/RecenTransferScreen.dart';

import '../salary_payroll/salary_dash_board.dart';
import '../travelcard_all/tc_form.dart';
import 'Add Money/Add Money.dart';
import '../cashout_all/CashOutPage.dart';
import 'Merchant Pay.dart';
import '../mobile_recharge_all/Mobile Recharge Page.dart';
import 'SendMoney/SendMoneyPage.dart';
import 'SendMoney/contact_page_send_money.dart';
import '../mobile_recharge_all/contacts_page.dart';



class HomePage extends StatelessWidget {

  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String pin;
  final String balance;

  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference rf = FirebaseDatabase.instance.ref("User_profile");





  static List offer=[
    Image.network('https://thumbs.dreamstime.com/b/special-offer-star-7527442.jpg'),
    Image.network('https://www.tbsnews.net/sites/default/files/styles/very_big_1/public/images/2021/02/02/bkash.jpg'),
    Image.network('https://static1.bigstockphoto.com/6/0/4/large2/406147223.jpg'),
    Image.network('https://i0.wp.com/mytechoffer.com/wp-content/uploads/2020/10/Website-Image_English.jpg?resize=780%2C403&ssl=1'),
    Image.network('https://www.businessinsiderbd.com/media/imgAll/2020October/en/bkash-2108181309.jpg'),

  ];

   HomePage({super.key, required this.phoneNumber, required this.firstName, required this.lastName, required this.pin,required this.balance});

  // HomePage({super.key, required this.phoneNumber});




  @override
  Widget build(BuildContext context) {




    return Scaffold(
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
                    Image.asset('assets/images/Payments_All.png',height: 60,width: 60,),
                    Text('Payments All',
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
                    Text('৳ $balance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,))
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
                                  balance: balance,
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
                                child: Image.asset('assets/images/merchant_pay.png',height: 40,width: 40,)),
                            // Icon(Icons.shopping_cart_sharp,color: Colors.white),SizedBox(height: 5,),

                            Text('Merchant Pay',style: TextStyle(color:Colors.white))
                          ],
                        )),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ContactPageSendMoney();
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
                                child: Image.asset('assets/images/send_money.png',height: 40,width: 40,)),
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
                              pin: pin,
                              balance: balance,);
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
                                child: Image.asset('assets/images/cash_out.png',height: 35,width: 35,)),
                            // Icon(Icons.account_balance_wallet_outlined,color: Colors.white,),SizedBox(height: 5,),
                            Text('Cash Out',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white))
                          ],
                        )),
                  ],
                ),
              ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,width: 350,
                //color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
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
                                    child: Image.asset('assets/images/add_money.png',),
                                  radius: 26,
                                  //Icon(Icons.account_balance_wallet_sharp,color: Colors.black,)
                                ),
                                Text('Add Money',style: TextStyle(color:Color(0xFF80140E)))
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
                                    return ContactsPage();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Color(0xFFFFF8F8),
                                  radius: 26,
                                    child: Image.asset('assets/images/money_recharge.png',) ,

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
                                    return TCForm();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Color(0xFFFFF8F8),
                                  radius: 26,
                                    child: Image.asset('assets/images/Travel card.png',height: 40,) ,

                                ),
                                const Text('Travel Card',style: TextStyle(color:Color(0xFF80140E)))
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return BillPayPage();
                              //     },
                              //   ),
                              // );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Color(0xFFFFF8F8),
                                  radius: 26,
                                    child: Image.asset('assets/images/Quick Pay.png',),

                                  //Icon(Icons.receipt_sharp,color: Colors.black)
                                ),
                                const Text('Quick Pay',style: TextStyle(color:Color(0xFF80140E)))
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
                                  radius: 26,
                                    child: Image.asset('assets/images/bill_pay.png',),

                                  //Icon(Icons.receipt_sharp,color: Colors.black)
                                ),
                                const Text('Bill Pay',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )
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
                                    return BankTransferPage();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: const Color(0xFFFFF8F8),
                                    radius: 26,
                                    child: Image.asset('assets/images/bank_transfer.png',),
                                ),
                                const Text('Bank Transfer',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),




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
                                    return GovernmentFeesPage();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: const Color(0xFFFFF8F8),
                                  radius: 26,
                                  child: Image.asset('assets/images/Govt Fees.png',),
                                ),
                                const Text('Govt. Fees',style: TextStyle(color:Color(0xFF80140E)))
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
                                  child: Image.asset('assets/images/mobile Bank.png',),
                                ),
                                const Text('Mobile Banking',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )),
                        TextButton(
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
                                  child: Image.asset('assets/images/ticket.png',),
                                ),
                                const Text('Ticketing',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )),



                        SizedBox(width: 10,),











                      ],
                    ),
                    Row(
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
                                    return SalaryDashBoard();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                    backgroundColor: const Color(0xFFFFF8F8),
                                    radius: 26,
                                    child: Icon(Icons.wallet,
                                      color: Colors.red.shade900,
                                      size: 40,
                                    )//Image.asset('assets/images/Govt Fees.png',),
                                ),
                                const Text('Salary Payroll',style: TextStyle(color:Color(0xFF80140E)))
                              ],
                            )),
                      ],
                    ),

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
                                      return RecentTransferScreen();
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
    );
  }


  // Future<String> naam()async{
  //
  //   final snapshot_fname= await rf.child(phoneNumber.toString()).child("first_name").get();
  //   final snapshot_lname= await rf.child(phoneNumber.toString()).child("last_name").get();
  //
  //   return snapshot_fname.toString()+" "+snapshot_lname.toString();
  //
  //
  // }
  //
  // Future<String> phone()async{
  //
  //   final snapshot_mobile_no= await rf.child(phoneNumber.toString()).child("mobile_no").get();
  //
  //   return snapshot_mobile_no.toString();
  //
  // }






}
