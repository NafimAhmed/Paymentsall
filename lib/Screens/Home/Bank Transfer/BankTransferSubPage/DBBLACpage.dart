import 'package:flutter/material.dart';

class DBBLacPage extends StatefulWidget {
  const DBBLacPage({Key? key}) : super(key: key);

  @override
  State<DBBLacPage> createState() => _DBBLacPageState();
}

class _DBBLacPageState extends State<DBBLacPage> {
  TextEditingController _account=TextEditingController();
  TextEditingController _amount=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Container(
          height: 350,width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('   Account Type',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    GestureDetector(child: Icon(Icons.circle_outlined),
                    onTap: (){},
                    ),
                    Text('  Account'),
                    SizedBox(width: 20,),

                    GestureDetector(child: Icon(Icons.circle_outlined),
                      onTap: (){},
                    ),
                    Text('  Debt Card'),
                  ],
                ),
                SizedBox(height: 20,),
                Text('   DBBL CBS Account',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 40,width: 296,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: _account,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.grey,),
                          hintText: 'DBBL CBS Account',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text('    Amount',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,width: 296,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white
                    ),
                    child: TextField(
                      controller: _amount,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.attach_money_rounded,size: 30,color: Colors.grey,),
                        hintText: 'Amount',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.only(left: 25,),
                    child: Container(
                      height: 40,width: 270,
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
                        child: Text('SUBMIT',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                      ),
                    )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
