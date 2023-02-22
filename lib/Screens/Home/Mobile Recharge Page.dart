import 'package:flutter/material.dart';

// class Operator{
//    int id;
//    String name;
//    Image images;
//   Operator(
//      this.id, this.name, this.images
// );
// }

class MobileRechargePage extends StatefulWidget {
  const MobileRechargePage({Key? key}) : super(key: key);

  @override
  State<MobileRechargePage> createState() => _MobileRechargePageState();
}

class _MobileRechargePageState extends State<MobileRechargePage> {
  final TextEditingController _mobileNumber=TextEditingController();
  //TextEditingController _operator=TextEditingController();

    String? _selected;
  static List<Map>_operatorList=[
    {
      'id': '0',
      'image': 'assets/images/airtel.png',
      'name': 'Airtel'
    },
    {
      'id': '1',
      'image': 'assets/images/banglalik.png',
      'name': 'Banglalink'
    },
    {
      'id': '2',
      'image': 'assets/images/grameenphone.png',
      'name': 'Grameenphone'
    },
    {
      'id': '3',
      'image': 'assets/images/robi.png',
      'name': 'Robi'
    },
    {
      'id': '4',
      'image': 'assets/images/TeleTalk.png',
      'name': 'Teletalk'
    },
  ];

  // static List<Operator> operatorList(){
  //   return <Operator>[
  //     Operator( 1,  'Airtel',  Image.asset('assets/images/airtel.png')),
  //     Operator( 2,  'Banglalink',  Image.asset('assets/images/banglalik.png')),
  //     Operator( 3,  'Grameenphone',  Image.asset('assets/images/grameenphone.png')),
  //     Operator( 4,  'Robi',  Image.asset('assets/images/robi.png')),
  //     Operator( 5,  'Teletalk', Image.asset('assets/images/TeleTalk.png')),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                Text('Mobile Recharge',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 320,width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text('   Mobile Number',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,width: 296,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: _mobileNumber,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.account_circle,size: 30,color: Colors.grey,),
                          hintText: 'Pre-paid/Post-paid',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(Icons.contact_phone_outlined),
                          suffixIconColor: Color(0xFFFCDEDE),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('   Operator',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red.shade900)),
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
                                      _selected=newValue as String ;
                                    });
                                  },
                                  items: _operatorList.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                        child: Row(
                                          children: [
                                            Image.asset(e['image'],height: 30,width: 40,),
                                            SizedBox(width: 15,),
                                            Text(e['name'])
                                          ],
                                        )
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
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.all(16.0),
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
                      onPressed: (){},
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
    );
  }
}