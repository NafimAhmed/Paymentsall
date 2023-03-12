import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_all_app/utils/app_layout.dart';

class ConfirmPaymentPage extends StatefulWidget {
  final String accountNumber,accountName,amount;

  const ConfirmPaymentPage({super.key, required this.accountNumber, required this.accountName, required this.amount});

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
        title: Text('Successful Payment',style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,

          backgroundColor: Color(0xFFFFF8F8)

      ),

      backgroundColor: Color(0xFFFFF8F8),

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
                      Column(children:[Text('Account Number \n ${widget.accountNumber}', style: GoogleFonts.openSans(fontSize: 16.0))]),
                      Column(children:[Text('Account Name \n${widget.accountName}', style: GoogleFonts.openSans(fontSize: 16.0))]),
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
                      Column(children:[Text('৳ ${widget.amount}.00', style: TextStyle(fontSize: 16.0))]),
                      Column(children:[Text('+৳ 00.00', style: TextStyle(fontSize: 16.0))]),
                      Column(children:[Text('৳ ${widget.amount}.00', style: TextStyle(fontSize: 16.0))]),
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
                  borderRadius: BorderRadius.all(
                      Radius.circular(70.0)), // Set rounded corner radius
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
