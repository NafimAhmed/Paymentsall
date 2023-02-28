import 'package:flutter/material.dart';

class PayBillHistoryPage extends StatefulWidget {
  const PayBillHistoryPage({Key? key}) : super(key: key);

  @override
  State<PayBillHistoryPage> createState() => _PayBillHistoryPageState();
}

class _PayBillHistoryPageState extends State<PayBillHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8F8),
        title: Text('Pay Bill History',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (BuildContext context,int index)
                  {
                    return TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                      },
                      child: Card(
                        elevation: 0.0,
                        child: ListTile(
                          leading: Icon(Icons.menu_book_sharp),
                          title: Text('DI University'),
                          subtitle: Text('27th February, 2023  3:50 PM'),
                          trailing: Text('৳ 5000.00',style: TextStyle(fontWeight: FontWeight.w500),),
                        ),
                      ),
                    );
                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}
