




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_layout.dart';



class MarchentPayConfirmation extends StatefulWidget{


  final String receiveNumb,totAmount,ref;

  const MarchentPayConfirmation({super.key, required this.receiveNumb, required this.totAmount, required this.ref});

  @override
  State<MarchentPayConfirmation> createState() => _MarchentPayConfirmationState();
}

class _MarchentPayConfirmationState extends State<MarchentPayConfirmation>with TickerProviderStateMixin {

  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=.90){

      controller.stop();

      Fluttertoast.showToast(
          msg: "Done controller",
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
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 30,),
            SafeArea(
              child: Row(
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                  Text('Conferm your payment',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),)
                ],
              ),
            ),

            SizedBox(height: 40,),

            Text("XYZ Store",
              style: GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),

            Text(widget.receiveNumb,
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
                    Column(children:[Text('Total :\n ৳ ${widget.totAmount}', style: GoogleFonts.openSans(fontSize: 20.0))]),
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




          ],
        ),
      ),
    );
  }
}