

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Mobile Recharge Page.dart';
import '../Home/SendMoney/SendMoneyPage.dart';


class ContactsPage extends StatefulWidget {

  final String pin,balance;
  const ContactsPage({Key? key, required this.pin, required this.balance}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {


// class ContactsPage extends StatefulWidget {
//
//   @override
//   _ContactsPageState createState() => _ContactsPageState();
// }
//
// class _ContactsPageState extends State<ContactsPage> {
//
//

  List<Contact>? _contacts;
  bool _permissionDenied = false;
  TextEditingController _mobileNo=TextEditingController();

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
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xFFFFF8F8),
          appBar: AppBar(
            elevation: 0.0,
            title: Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back,color: Colors.black,)),
              Text('Mobile Recharge',style: TextStyle(
                  color: Colors.black)),
            ],
          ),
            backgroundColor: const Color(0xFFFFF8F8),

          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
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
                      controller: _mobileNo,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.red.shade300,),
                        hintText: 'Enter your Mobile No.',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        suffixIcon: InkWell(
                          onTap: (){
                            if(_mobileNo.text.toString().isNotEmpty)
                              {
                                Navigator.pop(context);
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => MobileRechargePag(
                                            contacts:_mobileNo.text.toString(), pin: widget.pin, balance: widget.balance,
                                        )
                                    )
                                );
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

                            child: Icon(Icons.arrow_forward)
                        ),
                        suffixIconColor: Colors.red.shade900,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _body(),
                ),
              ],
            ),
          )));


  Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => ListTile(
            title: Text(_contacts![i].displayName),
            onTap: () async {

             final fullContact = await FlutterContacts.getContact(_contacts![i].id);


           if(fullContact!.phones.first.number.isNotEmpty) {

             String newText = fullContact!.phones.first.number;
             final updatedText = newText;
             _mobileNo.value = _mobileNo.value.copyWith(
               text: updatedText,
               selection: TextSelection.collapsed(offset: updatedText.length),
             );

             // Navigator.pop(context);
             //
             // await Navigator.of(context).push(
             //     MaterialPageRoute(builder: (_) => MobileRechargePag(
             //       contacts:fullContact!.phones.first.number, pin: widget.pin, balance: widget.balance,)
             //     )
             // );
              }

              else{


             //
             // Navigator.of(context).push(MaterialPageRoute(builder: (_) => MobileRechargePag(contacts:"none", pin: widget.pin, balance: widget.balance,)));

      Fluttertoast.showToast(
          msg: "this contact has no number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

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
