import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class ConfirmPaymentPage extends StatefulWidget {
  const ConfirmPaymentPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPaymentPage> createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> with TickerProviderStateMixin{


  ////////////////////////////////////////////////////////

  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=.90){

      controller.stop();

      Fluttertoast.showToast(
          msg: "Done",
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

  bool determinate = false;

  @override
  void dispose() {
    controller.dispose();

    Fluttertoast.showToast(
        msg: "Done",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );


    super.dispose();
  }

  //////////////////////////////////////////////////////










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Your Payment',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),


      body: Container(
        margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(20)),
        child: Column(
          children: [



            SizedBox(height: 40,),
            Container(
              height: 90,
              width: 330,
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/ait.png',height: 30,)),
                title: Text('Land Development(LD) Tax'),
                subtitle: Text('Govt. Fees'),
              ),
            ),
            SizedBox(height: 10,),


            Table(
              border: TableBorder.all(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1),

              children: [
                TableRow(
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    children: [
                      Column(children:[Text('Account Number \n 01771389547', style: GoogleFonts.openSans(fontSize: 16.0))]),
                      Column(children:[Text('Account Name \nNafim Ahmed', style: GoogleFonts.openSans(fontSize: 16.0))]),
                    ]
                ),

              ],
            ),

            Gap(20),

            Table(
              border: TableBorder.all(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1),

              children: [
                TableRow(
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    children: [
                      Column(children:[Text('Amount\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                      Column(children:[Text('Charge\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                      Column(children:[Text('Total\n', style: GoogleFonts.openSans(fontSize: 16.0))]),
                    ]),
                TableRow(
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    children: [
                      Column(children:[Text('৳ ', style: TextStyle(fontSize: 16.0))]),
                      Column(children:[Text('+৳ 0.00', style: TextStyle(fontSize: 16.0))]),
                      Column(children:[Text('৳ ', style: TextStyle(fontSize: 16.0))]),
                    ]),

              ],
            ),


            ///////////////////////////////////////////////////



            ////////////////////////////////

            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',

            ),



            ////////////////////////////









            InkWell(
              onTapDown: (Detail) async {
                //startRecording();
                //controller.reset();
                controller.repeat();

                if(controller.value>=.99){

                  controller.stop();

                }



              },
              child: Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  // border: Border.all(width: 3.0),   // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(70.0)), // Set rounded corner radius
                  //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                ),

                child: Text("Tap to\n Confirm",
                  style: GoogleFonts.openSans(
                      fontSize: 25
                  ),
                ),
              ),
              onTapUp: (detail) {
                controller.stop();


                Fluttertoast.showToast(
                    msg: controller.value.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                controller.reset();

              },

            ),









            //////////////////////////////////////////////////










          ],
        ),
      ),




    );
  }
}
