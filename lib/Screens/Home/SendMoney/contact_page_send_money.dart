

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../mobile_recharge_all/Mobile Recharge Page.dart';
import 'QRCode_send_money/send_money_qrcode_scanner.dart';
import 'SendMoneyPage.dart';

//
// class ContactsPage extends StatefulWidget {
//   @override
//   _ContactsPageState createState() => _ContactsPageState();
// }
//
// class _ContactsPageState extends State<ContactsPage> {

  class ContactPageSendMoney extends StatefulWidget {

    final String pin,balance;
    const ContactPageSendMoney({Key? key, required this.pin, required this.balance}) : super(key: key);

    @override
    State<ContactPageSendMoney> createState() => _ContactPageSendMoneyState();
  }

  class _ContactPageSendMoneyState extends State<ContactPageSendMoney> {
    TextEditingController _writeMobileNo=TextEditingController();

  List<Contact>? _contactss;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contactss = contacts);
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(


            automaticallyImplyLeading: true,
            elevation: 0.0,
            toolbarHeight: 100,


            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_sharp,
                          color: Colors.black,)),


                    Text('Send Money',
                      style: TextStyle(
                          color: Colors.black),),


                    Spacer(),


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
                                return SendMoneyQRCodeScanner();
                              },
                            ),
                          );



                        },
                        child: Icon(Icons.qr_code_scanner_sharp,color: Colors.red.shade300,size: 30,))


                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,top: 3.0),
                      child: Container(
                        height: 40,width: 296,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white
                        ),
                        child: TextField(
                          controller: _writeMobileNo,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.red.shade900,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.red.shade300),
                            hintText: 'Write Your Mobile No.',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            suffixIcon: InkWell(
                                onTap: () {
                                  if(_writeMobileNo.text.isNotEmpty){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_) => SendMoneyPage(contacts:_writeMobileNo.text.toString(), name: '', pin: widget.pin, balance: widget.balance,)));
                                  }
                                  else
                                    {
                                      Fluttertoast.showToast(
                                          msg: "Please enter or select receiver phone number.Thank You! ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 10,
                                          backgroundColor: Colors.red.shade100,
                                          textColor: Colors.black,
                                          fontSize: 16.0
                                      );
                                    }

                                },
                                child: Icon(Icons.arrow_forward)),
                            suffixIconColor: Colors.red.shade900
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
              backgroundColor: Color(0xFFFFF8F8),

          ),
          backgroundColor: Color(0xFFFFF8F8),

          body: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: _body(),
          )
      )
  );


  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contactss == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _contactss!.length,
        itemBuilder: (context, i) => ListTile(
            title: Text(_contactss![i].displayName),
            onTap: () async {
              final fullContact =
              await FlutterContacts.getContact(_contactss![i].id);
              if(fullContact!.phones.first.number.toString().isNotEmpty){

                await Navigator.of(context).push(MaterialPageRoute(builder: (_) => SendMoneyPage(contacts:fullContact!.phones.first.number.toString(), name: fullContact.name.first, pin: widget.pin, balance: widget.balance,)));

              }

            }));
  }
}


class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Column(children: [
        Text('First name: ${contact.name.first}'),
        Text('Last name: ${contact.name.last}'),
        Text(
            'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
        Text(
            'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
      ]));
}
