import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Contacts{
  late final String name;
  late final Image image;
  late final String number;

  Contacts({
    required this.name,
    required this.image,
    required this.number,
  });
}

final List<Contacts> contactList=[
  Contacts(name: 'kaka', image: Image.asset('assets/images/cat1.jpg'), number: '+91 8050530XXX'),
  Contacts(name: 'Jane', image: Image.asset('assets/images/cat2.jpg'), number: '+91 505053XXXX'),
  Contacts(name: 'Leah', image: Image.asset('assets/images/cat3.jpg'), number: '+91 905053XXXX'),
  Contacts(name: 'Merry', image: Image.asset('assets/images/cat4.jpg'), number: '+91 605053XXXX'),
  Contacts(name: 'Mike', image: Image.asset('assets/images/cat5.jpg'), number: '+91 705053XXXX'),
];
class SendMoneyPage extends StatefulWidget {

  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  TextEditingController _sendMoney = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();

  List<Contacts> contactList =  [];
  List<Contacts>? contactListSearch;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
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
                Text('Send Money',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _searchController,
                cursorColor: Colors.red,
                focusNode: _textFocusNode,
                decoration: InputDecoration(
                  hintText: 'Enter Name or Number',
                  suffixIcon: Icon(Icons.search),
                    suffixIconColor: Colors.black,
                    suffixStyle: TextStyle( fontSize: 19,fontWeight: FontWeight.w500),
                    hintStyle: TextStyle( fontSize: 18,color: Colors.grey.shade400,fontWeight: FontWeight.w400),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200)
                    )
                ),
                onChanged: (value){
                  // setState(() {
                  //   contactListSearch=contactList
                  //       .where((element) => element.name
                  //       .toLowerCase()
                  //       .contains(value.toLowerCase())).toList();
                  //   if(_searchController.text.isNotEmpty && contactList.isEmpty){
                  //     if(kDebugMode){
                  //       print('itemListSearch Length ${contactListSearch!.length}');
                  //     }
                  //   }
                  // });
                },
              ),
            ),
            // Expanded(child: _searchController.text.isNotEmpty && contactList.isEmpty ? Center()
            //     : ListView.builder(
            //   itemCount: _searchController.text.isNotEmpty
            //       ? contactListSearch!.length
            //     : contactList.length,
            //     itemBuilder: (context, index){
            //     return Container(
            //       height: 300,
            //       width: 350,
            //       color: Colors.white,
            //       child: ListView.builder(
            //           itemCount: contactList.length,
            //           itemBuilder: (context, index){
            //             return Column(
            //               children: [
            //                 Container(
            //                   child: CircleAvatar(
            //                     backgroundColor: Colors.white,
            //                     child: Image.asset('assets/images/cat1.jpg'),
            //                   ),
            //                 ),
            //                 Text('Kaka'),
            //                 Text('+91 8050530XXX'),
            //               ],
            //             );
            //           }),
            //     );
            //
            //     }))
        Container(
          height: 120,width: 350,
          child: Image.asset('assets/images/cat1.jpg',height: 100,width: 120,),
        ),SizedBox(height: 5,),
        Text('Kaka',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),SizedBox(height: 5,),
        Text('+91 8050530XXX',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey)),
            SizedBox(height: 10,),
          Container(
            height: 385,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.light,
                    controller: _sendMoney,
                    cursorColor: Colors.red,
                    focusNode: _textFocusNode,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Amount',
                         hintStyle: TextStyle( fontSize: 18,color: Colors.grey.shade400,fontWeight: FontWeight.w400),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200)
                        )
                    ),
                    onChanged: (value){
                      // setState(() {
                      //   contactListSearch=contactList
                      //       .where((element) => element.name
                      //       .toLowerCase()
                      //       .contains(value.toLowerCase())).toList();
                      //   if(_searchController.text.isNotEmpty && contactList.isEmpty){
                      //     if(kDebugMode){
                      //       print('itemListSearch Length ${contactListSearch!.length}');
                      //     }
                      //   }
                      // });
                    },
                  ),
                  SizedBox(height: 217,),
                  Container(
                    height: 80,
                    color: Colors.white,
                    child: Center(
                      child: SizedBox(height: 50,width: 320,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: (){},
                          child: Text('Send',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
