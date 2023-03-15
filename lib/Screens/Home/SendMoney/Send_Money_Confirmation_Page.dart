




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_layout.dart';
import 'TransferReceiptScreen.dart';



class SendMoneyConfirmationPage extends StatefulWidget{


  final String contacts,name,amount,ref,pin;
  const SendMoneyConfirmationPage({super.key, required this.contacts, required this.name, required this.amount, required this.ref, required this.pin, });

  @override
  State<SendMoneyConfirmationPage> createState() => _SendMoneyConfirmationPageState();
}

class _SendMoneyConfirmationPageState extends State<SendMoneyConfirmationPage>with TickerProviderStateMixin {

  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=.99){

      controller.stop();

      Fluttertoast.showToast(
          msg: "Done Transaction",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
    setState(() {

    });
  });
  // bool determinate = false;



  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }


///////////////////////////////////////////////////////









  @override
  Widget build(BuildContext context) {




    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F8),
        title: const Text('Send Money Confirmation',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),

        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 16,top: 30,bottom: 16),
          child: Container(
            height: 600,width: 320,
            decoration: BoxDecoration(
                border: Border.all(width: 1,color: Color(0xFFFCDEDE),),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(height: 40,),

                Text("XYZ Store",
                  style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Text(widget.contacts,
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(21)),
                  child: Table(

                    border: TableBorder.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow( children: [
                        Column(children:[Text('Total :\n ৳ ${widget.amount}', style: GoogleFonts.openSans(fontSize: 20.0))]),
                        Column(children:[Text('New Balance :\n ৳ 21.00', style: GoogleFonts.openSans(fontSize: 20.0))]),
                      ]),

                      TableRow( children: [
                        Column(children:[Text('Refernce : \n', style: GoogleFonts.openSans(fontSize: 20.0))]),
                        Column(children:[Text(widget.ref, style: GoogleFonts.openSans(fontSize: 20.0))]),
                      ]),


                    ],
                  ),
                ),




                ////////////////////////////////

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xFFFFF8F8),
                    color: Color(0xFFF59191),
                    minHeight: 8,
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',

                  ),
                ),



                ////////////////////////////



                InkWell(
                  onTapDown: (Detail) async {
                    //startRecording();
                    //controller.reset();
                    controller.repeat();

                    if(controller.value>=1){

                      controller.stop();

                    }


                  },
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TransferReceiptPage(recNumb: widget.contacts, recName: widget.name, recAmount: widget.amount, pin: '',);

                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(40),
                    margin: EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.all(
                          Radius.circular(70.0)), // Set rounded corner radius
                    ),

                    child: Text("Tap to Confirm",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                  ),
                  onTapUp: (detail) {
                    controller.stop();

                    controller.reset();

                  },

                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}