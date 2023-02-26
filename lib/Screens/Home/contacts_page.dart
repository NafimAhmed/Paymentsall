

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Mobile Recharge Page.dart';
import 'SendMoney/SendMoneyPage.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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
      home: Scaffold(
          appBar: AppBar(title: Text('flutter_contacts_example')),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _mobileNo,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red.shade900,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.grey,),
                    hintText: 'Mobile or A/C No',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: InkWell(
                      onTap: (){

                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => MobileRechargePag(contacts:_mobileNo.text.toString())));
                      },
                        child: Icon(Icons.arrow_forward)
                    ),
                    suffixIconColor: Colors.red.shade900,
                  ),
                ),
                _body(),
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
     await Navigator.of(context).push(MaterialPageRoute(builder: (_) => MobileRechargePag(contacts:fullContact!.phones.first.number)));
    }
    else{

      Navigator.of(context).push(MaterialPageRoute(builder: (_) => MobileRechargePag(contacts:"none")));

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
