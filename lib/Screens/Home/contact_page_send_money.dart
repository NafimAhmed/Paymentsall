

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../mobile_recharge_all/Mobile Recharge Page.dart';
import 'SendMoney/SendMoneyPage.dart';

//
// class ContactsPage extends StatefulWidget {
//   @override
//   _ContactsPageState createState() => _ContactsPageState();
// }
//
// class _ContactsPageState extends State<ContactsPage> {

  class ContactPageSendMoney extends StatefulWidget {
    const ContactPageSendMoney({Key? key}) : super(key: key);

    @override
    State<ContactPageSendMoney> createState() => _ContactPageSendMoneyState();
  }

  class _ContactPageSendMoneyState extends State<ContactPageSendMoney> {
  //   @override
  //   Widget build(BuildContext context) {
  //     return const Placeholder();
  //   }
  // }

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
      home: Scaffold(
        // backgroundColor: Color(0xFFFFF8F8),
          appBar: AppBar(title: Row(
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
              Text('Send Money',style:  TextStyle(color: Colors.black),),
            ],
          ),
              backgroundColor: Color(0xFFFFF8F8),

          ),
          backgroundColor: Color(0xFFFFF8F8),

          body: _body()));


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
              await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SendMoneyPage(contacts:fullContact!)));
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
