import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:payments_all_app/Screens/mobile_recharge_all/mobile_recharge_amount.dart';

class MobileRechargePag extends StatelessWidget {
  final TextEditingController _mobileNumber=TextEditingController();

  final String? contacts;


  String operator(String contacts){
    String nim,cont;
    if(contacts.substring(0,3)=="+88"){
      contacts=contacts.substring(1);
      contacts=contacts.substring(1);
      contacts=contacts.substring(1);
    }

    cont=contacts;

    if(cont.substring(0,3)=="017")
      {
        nim="Grameen";
      }
    else if(cont.substring(0,3)=="013")
    {
      nim="Skitto";
    }
    else if(cont.substring(0,3)=="019")
    {
      nim="Banglalink";
    }
    else if(cont.substring(0,3)=="015")
    {
      nim="Teletalk";
    }
    else if(cont.substring(0,3)=="014")
    {
      nim="Banglalink";
    }
    else if(cont.substring(0,3)=="016")
    {
      nim="Robi";
    }
    else if(cont.substring(0,3)=="018")
    {
      nim="Robi";
    }
    else{
      nim="can't detect";
    }





    return nim;
  }

  //_mobileNumber= " ${contacts.phones.isNotEmpty ? contacts.phones.first.number : '(none)'}"
  //TextEditingController _operator=TextEditingController();

    String? _selected;
  static List<Map>_operatorList=[
    {
      'id': '0',
      'image': 'assets/images/airtel.png',
      'name': 'Airtel'
    },
    {
      'id': '1',
      'image': 'assets/images/banglalik.png',
      'name': 'Banglalink'
    },
    {
      'id': '2',
      'image': 'assets/images/grameenphone.png',
      'name': 'Grameenphone'
    },
    {
      'id': '3',
      'image': 'assets/images/robi.png',
      'name': 'Robi'
    },
    {
      'id': '4',
      'image': 'assets/images/TeleTalk.png',
      'name': 'Teletalk'
    },
  ];

   MobileRechargePag({super.key, required this.contacts});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Column(
        children: [
          SizedBox(height: 30,),
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
                    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                Text('Mobile Recharge',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
          ),





          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 320,width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(' Phone Number : ',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,width: 296,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),
                          Text(
                               " ${contacts!.isNotEmpty ? contacts : '(none)'}"

                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  
                  Text(operator(contacts!)),
                  
                  Text('   Operator',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,width: 296,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  hint: Row(
                                    children: [
                                      CircleAvatar(
                                          child: Icon(Icons.cell_tower_rounded,color: Colors.white,),
                                      radius: 13,
                                      backgroundColor: Colors.grey,
                                      ), SizedBox(width: 15,),
                                      Text('Select Operator',style: TextStyle(fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  //value: _selected.isEmpty ? _selected : null,
                                  value: _selected,
                                  onChanged: (newValue){
                                    // setState(() {
                                    //   _selected=newValue as String ;
                                    // });
                                  },
                                  items: _operatorList.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                        child: Row(
                                          children: [
                                            Image.asset(e['image'],height: 30,width: 40,),
                                            SizedBox(width: 15,),
                                            Text(e['name'])
                                          ],
                                        )
                                    );
                                }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.all(16.0),
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
                      onPressed: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MobileRechargeAmount();
                            },
                          ),
                        );

                      },
                      child: Text('SUBMIT',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16)),
                    ),
                  )
                  ),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
