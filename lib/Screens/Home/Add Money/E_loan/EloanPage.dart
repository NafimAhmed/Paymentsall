import 'package:flutter/material.dart';

class EloanPage extends StatefulWidget {
  const EloanPage({Key? key}) : super(key: key);

  @override
  State<EloanPage> createState() => _EloanPageState();
}

class _EloanPageState extends State<EloanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('E-Loan',style: TextStyle(color: Colors.black)),
            Spacer(),
            TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: const Icon(
                              Icons.hexagon,color: Color(0xFFE57373),
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: const Icon(
                              Icons.star,color: Colors.white,size: 14,
                            ),

                          ),
                        ),

                      ],
                    ),
                    Text('0 Points',style: TextStyle(color: Colors.red.shade900)),
                  ],
                ))
          ],
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),

      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: Padding(

        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/Payments_All_Logo.png',),
            Text('')
          ],
        ),
      ),

    );
  }
}
