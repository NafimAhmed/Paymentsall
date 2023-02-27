import 'package:flutter/material.dart';

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
                height: 70,width: 330,
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6,),
                    Text('   Search Organization'),
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
                          suffixIcon: Icon(Icons.arrow_forward_sharp,color: Colors.grey,)
                        ),
                      ),
                    ),              ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 8,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 65,width: 162,
                    color: Colors.white,
                    child: TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          CircleAvatar(child: Icon(Icons.receipt_long_sharp)) ,SizedBox(width: 10,),
                          Text('Receipts & \nTokens')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 4,),
                  Container(
                    height: 65,width: 162,
                    color: Colors.white,
                    child: TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          // SizedBox(width: 8,),
                          CircleAvatar(child: Icon(Icons.leaderboard_sharp)),SizedBox(width: 10,),
                          Text('Pay Bill History')

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8,right: 8,top: 3),
            child: Container(
              height: 480,width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text('    All Organization'),
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
                            Icon(Icons.auto_stories,color: Colors.black,size: 40),

                            Text('Education')
                          ],
                        )),
                        TextButton(onPressed: (){}, child: Column(
                          children: [
                            //Image.asset('assets/images/card.png',height: 40,width: 30,),

                            Icon(Icons.credit_card,color: Colors.black,size: 40),
                            Text('Credit Card')
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
                            
                            Icon(Icons.assured_workload,color: Colors.black,size: 40),

                            Text('Govt.Fees')
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
                            Icon(Icons.commute_rounded,color: Colors.black,size: 40),

                            Text('Vehicle')
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
