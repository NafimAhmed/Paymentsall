import 'package:flutter/material.dart';

import '../FeesPage.dart';

class VATpage extends StatefulWidget {
  const VATpage({Key? key}) : super(key: key);

  @override
  State<VATpage> createState() => _VATpageState();
}

class _VATpageState extends State<VATpage> {
  TextEditingController _govtVATorg=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,width: 330,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),
                    Text('   Search Organization',style: TextStyle(color: Colors.red.shade900)),
                    Padding(
                      padding: const EdgeInsets.only(left: 12,top: 0),
                      child: TextField(
                        controller: _govtVATorg,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // prefixIcon: Icon(Icons.attach_money_rounded,size: 30,color: Colors.grey,),
                            hintText: 'Enter Organization name or type',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            suffixIcon: InkWell(
                                onTap: (){

                                },
                                child: Icon(Icons.arrow_forward_sharp,color: Colors.red.shade900,))
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 450,width: 330,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white
                ),
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        color: Colors.red.shade50,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                              child: Image.asset('assets/images/vat.png',height: 30,)),
                          title: Text('LPG Gas Vat'),
                          subtitle: Text('Govt. Fees'),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FeesPage();
                                },
                              ),
                            );
                          },

                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
