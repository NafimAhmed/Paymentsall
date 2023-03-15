import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:payments_all_app/Screens/mobile_recharge_all/mobile_recharge_amount.dart';

enum SingingCharacter { lafayette, jefferson }
class MobileRechargePag extends StatefulWidget {


  final String contacts,pin,balance;


   MobileRechargePag({super.key, required this.contacts, required this.pin, required this.balance});

  @override
  State<MobileRechargePag> createState() => _MobileRechargePagState();
}

class _MobileRechargePagState extends State<MobileRechargePag> {

  String connectionType='prepaid';

  //
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
    String _selected ='Select Operator';
  List<String>_operator=['Select Operator','Airtel','Banglalink','Grameenphone','Robi','Skitto','Teletalk'];


  @override
  Widget build(BuildContext context) {




    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 70,
        leading: TextButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text('Mobile Recharge',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
      ),


      backgroundColor: Color(0xFFFFF8F8),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 520,width: 320,
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
                                   "     ${widget.contacts!.isNotEmpty ? widget.contacts : '(none)'}"

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      //Text(operator(widget.contacts!)),

                      Text('   Operator',
                          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
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
                                        setState(() {
                                          _selected=newValue!;
                                        });
                                      },
                                      items: _operator.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                            child: Text(e)
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

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Connection Type : ",
                            style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)
                        ),
                      ),

                      Container(
                        child: Column(
                          children: <Widget>[
                            RadioListTile(
                              title: Text("Prepaid"),
                              value: "prepaid",
                              groupValue: connectionType,
                              onChanged: (value){
                                setState(() {
                                  connectionType = value.toString();
                                });
                              },
                            ),

                            RadioListTile(
                              title: Text("Postpaid"),
                              value: "postpaid",
                              groupValue: connectionType,
                              onChanged: (value){
                                setState(() {
                                  connectionType = value.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),


                      SizedBox(height: 10,),
                      Padding(
                          padding: EdgeInsets.all(16.0),
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
                                  return MobileRechargeAmount(
                                    recNumb: widget.contacts,
                                    connectionType: connectionType,
                                    operator: _selected,
                                  );
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
        ),
      ),
    );
  }
}
