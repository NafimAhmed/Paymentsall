import 'package:flutter/material.dart';

class FromOtherBankVisaCardInfo extends StatefulWidget {
  const FromOtherBankVisaCardInfo({Key? key}) : super(key: key);

  @override
  State<FromOtherBankVisaCardInfo> createState() => _FromOtherBankVisaCardInfoState();
}

class _FromOtherBankVisaCardInfoState extends State<FromOtherBankVisaCardInfo> {
  @override
  Widget build(BuildContext context) {
    bool checkboxValue = false;
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
                  const Text('Add Money',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 60,width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        SizedBox(height: 10,),
                        Text('Account No.'),
                        Text('017XXXXXXXX'),
                      ],
                    ),
                    Column(
                      children: const [
                        SizedBox(height: 10,),
                        Text('Amount'),
                        Text('000'),
                      ],
                    ),
                    Column(
                      children: const [
                        SizedBox(height: 10,),
                        Text('Fee'),
                        Text('000'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ),
           // SizedBox(height: 20,),
            Padding(padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 440,width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Container(
                        height: 400,width: 282,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 30,width: 282,color: Colors.grey.shade100,
                                child: Column(
                                  children: const [
                                    SizedBox(height: 5,),
                                    Text('Card Information'),
                                  ],
                                )),
                            const SizedBox(height: 10,),
                            const Text('   Card Number *'),
                            Padding(padding: EdgeInsets.all(10.0),
                            child: Container(
                              height: 25,width: 260,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: Colors.white
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,

                                ),
                              ),
                            ),
                            ),
                            const SizedBox(height: 10,),
                            const Text('   Card Holder Name *'),
                            Padding(padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 25,width: 260,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                                    borderRadius: BorderRadius.circular(2.0),
                                    color: Colors.white
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,

                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('   Expiry Date(MM/YY) *'),Spacer(),
                                Text('   CVV *     '),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                                        borderRadius: BorderRadius.circular(2.0),
                                        color: Colors.white
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,

                                      ),

                                    ),
                                  ),
                                  Text('  /  '),
                                  Container(
                                    height: 25,width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                                        borderRadius: BorderRadius.circular(2.0),
                                        color: Colors.white
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,

                                      ),

                                    ),
                                  ),Spacer(),
                                  Container(
                                    height: 25,width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                                        borderRadius: BorderRadius.circular(2.0),
                                        color: Colors.white
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      checkboxValue = !checkboxValue;
                                    });
                                  },
                                    child: Icon(Icons.square_outlined, color: checkboxValue ? Colors.blueAccent : Colors.red,size: 20,)
                                ),
                                const SizedBox(width: 5),
                                const Text('Save this card for future transaction')
                              ],
                            ),
                            ),
                            const SizedBox(height: 10,),
                            Padding(padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 50,width: 296,
                                  decoration: BoxDecoration(
                                    // border: Border.all(width: 1,color:),
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.red.shade900
                                  ),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    ),
                                    onPressed: (){},
                                    child: const Text('SUBMIT',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
