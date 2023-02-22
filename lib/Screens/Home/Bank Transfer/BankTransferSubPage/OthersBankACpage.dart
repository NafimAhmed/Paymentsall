import 'package:flutter/material.dart';

class OthersBankACpage extends StatefulWidget {
  const OthersBankACpage({Key? key}) : super(key: key);

  @override
  State<OthersBankACpage> createState() => _OthersBankACpageState();
}

class _OthersBankACpageState extends State<OthersBankACpage> {

   TextEditingController _bank=TextEditingController();
   TextEditingController _amount=TextEditingController();
   TextEditingController _accountNo=TextEditingController();


   //final List<String>bankList = [ 'Select Bank','Bangladesh','DBBL','EBL','National','Others'];
 // String dropdownvalue = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Container(
          height: 370,width: 320,
          decoration: BoxDecoration(
            //border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('   Select Bank',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 40,width: 296,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white
                    ),
                    child: GestureDetector(
                      child: TextField(
                        controller: _bank,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.comment_bank_sharp,size: 20,color: Colors.grey,),
                          hintText: 'Select Bank',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                          suffixIconColor: Colors.grey.shade500,
                        ),
                      //  readOnly: true,
                      ),
                      onTap: (){},
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text('   Account No.',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
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
                      controller: _accountNo,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.grey,),
                        hintText: 'Account No.',
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
                    keyboardType: TextInputType.text,
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
    );
  }
}
