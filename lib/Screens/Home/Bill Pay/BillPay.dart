import 'package:flutter/material.dart';
import 'package:payments_all_app/Screens/Home/Bill%20Pay/pay_bill_detail.dart';

import 'PayBillHistoryPage.dart';

class BillPayPage extends StatefulWidget {
  const BillPayPage({Key? key}) : super(key: key);

  @override
  State<BillPayPage> createState() => _BillPayPageState();
}

class _BillPayPageState extends State<BillPayPage> {
  TextEditingController _organization=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
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
                      child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
                  const Text('Bill Pay',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              ),
            ),





            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 74,width: 330,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                    borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6,),
                    Text('   Search Organization',style: TextStyle(color: Colors.red.shade900)),
                    Padding(
                      padding: const EdgeInsets.only(left: 12,top: 0),
                      child: TextField(
                        controller: _organization,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // prefixIcon: Icon(Icons.attach_money_rounded,size: 30,color: Colors.grey,),
                          hintText: 'Enter Organization name or type',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(Icons.arrow_forward_sharp,color: Colors.red.shade900,)
                        ),
                      ),
                    ),              ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 8,right: 8,bottom: 6),
              child: Container(
                height: 60,width: 330,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white
                ),
               // color: Colors.white,
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
                          return PayBillHistoryPage();
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                          child: Icon(Icons.leaderboard_sharp,color: Colors.white,)),SizedBox(width: 10,),
                      Text('Pay Bill History',style: TextStyle(color: Colors.black),),Spacer(),
                      Icon(Icons.arrow_forward,color: Colors.red.shade900,)

                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8,right: 8,top: 3),
            child: Container(
              height: 480,width: 330,
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text('    All Organizations'),
                    Divider(thickness: 1.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/electricity_logo.png',height: 40,width: 40,),

                            Icon(Icons.electric_bolt,color: Colors.black,size: 40),
                            Text('Electricity')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/gas.png',height: 40,width: 40,),
                            Icon(Icons.local_fire_department_outlined,color: Colors.black,size: 40),
                            Text('Gas')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/Water tap.png',height: 41,width: 30,),
                            Icon(Icons.water_drop_outlined,color: Colors.black,size: 40),
                            Text('Water')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/internet.png',height: 40,width: 30,),
                            Icon(Icons.language_outlined,color: Colors.black,size: 40),
                            Text('Internet')
                          ],
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),





                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/telephone.png',height: 40,width: 40,),

                            Icon(Icons.phone,color: Colors.black,size: 40),

                            Text('Telephone')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/tv.png',height: 40,width: 40,),
                            Icon(Icons.live_tv,color: Colors.black,size: 40),
                            Text('TV')
                          ],
                        )),

                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/education.png',height: 41,width: 30,),
                            Icon(Icons.auto_stories_outlined,color: Colors.black,size: 40),

                            Text('School\nFee')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/education.png',height: 41,width: 30,),
                            Icon(Icons.book_outlined ,color: Colors.black,size: 40),

                            Text('College\nFee')
                          ],
                        )),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/map.png',height: 40,width: 40,),
                            
                            Icon(Icons.school,color: Colors.black,size: 40),

                            Text('University\nFee')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/insurance.png',height: 40,width: 40,),
                            Icon(Icons.add_moderator_outlined,color: Colors.black,size: 40),
                            Text('Insurance')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/vehicle.png',height: 41,width: 30,),
                            Icon(Icons.airport_shuttle_outlined,color: Colors.black,size: 40),

                            Text('Bus\nTicket')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            Icon(Icons.train_outlined,size: 40,color: Colors.black,),
                           // Image.asset('assets/images/internet.png',height: 40,width: 30,),
                            Text('Train\nTicket')
                          ],
                        )),
                      ],
                    ),
                    Divider(thickness: 1.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/map.png',height: 40,width: 40,),

                            Icon(Icons.airplane_ticket_outlined,color: Colors.black,size: 40),

                            Text('Air\nTicket')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/insurance.png',height: 40,width: 40,),
                            Icon(Icons.medical_information,color: Colors.black,size: 40),
                            Text('Doctor\nBills')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/vehicle.png',height: 41,width: 30,),
                            Icon(Icons.medical_services_outlined,color: Colors.black,size: 40),

                            Text('Diagonostic\nBill')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            Icon(Icons.medication_liquid_sharp,size: 40,color: Colors.black,),
                            // Image.asset('assets/images/internet.png',height: 40,width: 30,),
                            Text('Medicine\nBills')
                          ],
                        )),
                      ],
                    ),
                    Divider(thickness: 1.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/map.png',height: 40,width: 40,),

                            Icon(Icons.payment,color: Colors.black,size: 40),

                            Text('Remittances')
                          ],
                        )),
                        // TextButton(onPressed: (){}, child: Column(
                        //   children: [
                        //     //Image.asset('assets/images/insurance.png',height: 40,width: 40,),
                        //     Icon(Icons.wallet_giftcard_sharp,color: Colors.black,size: 40),
                        //     Text('Salary\nPayroll')
                        //   ],
                        // )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/vehicle.png',height: 41,width: 30,),
                            Icon(Icons.add_card_outlined ,color: Colors.black,size: 40),

                            Text('Mobile Bank\nTransfer')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            Icon(Icons.local_grocery_store,size: 40,color: Colors.black,),
                            // Image.asset('assets/images/internet.png',height: 40,width: 30,),
                            Text('Daily\nGoods')
                          ],
                        )),
                      ],
                    ),
                    Divider(thickness: 1.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/map.png',height: 40,width: 40,),

                            Icon(Icons.assured_workload,color: Colors.black,size: 40),

                            Text('Government\nFees')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/insurance.png',height: 40,width: 40,),
                            Icon(Icons.credit_score,color: Colors.black,size: 40),
                            Text('Credit\nCard')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/vehicle.png',height: 41,width: 30,),
                            Icon(Icons.account_balance_outlined ,color: Colors.black,size: 40),

                            Text('Bank\nTransfer')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            Icon(Icons.more_horiz,size: 40,color: Colors.black,),
                            // Image.asset('assets/images/internet.png',height: 40,width: 30,),
                            Text('Others')
                          ],
                        )),
                      ],
                    ),
                    Divider(thickness: 1.5,),


                    Container(
                      child: Column(
                        children: [

                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (BuildContext context,int index){

                                return ListTile(
                                  leading: Image.asset("assets/images/Payments_All.png"),
                                  title: Text("Organization name"),
                                  subtitle: Text(" Bill Type name"),

                                  onTap: (){

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PayBillDetil();
                                        },
                                      ),
                                    );

                                  },

                                );

                              }
                          )

                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            ),









          ],
        ),
      ),
    );
  }
}
