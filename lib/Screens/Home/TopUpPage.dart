import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactNumberAccess extends StatefulWidget {
  const ContactNumberAccess({Key? key}) : super(key: key);

  @override
  State<ContactNumberAccess> createState() => _ContactNumberAccessState();
}

class _ContactNumberAccessState extends State<ContactNumberAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
          TextButton(onPressed: (){}, child: Text('Contact No.'))
        ],
      ),
    );
  }
}
