import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
        title: Text('Profile',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [



            TextButton(
              onPressed: (){},
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                  radius: 50,
                  child: Icon(Icons.perm_identity,size: 100,color: Colors.white,)),
            ),


            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
