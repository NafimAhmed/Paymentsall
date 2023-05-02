import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_layout.dart';
import 'SuccessfulPage.dart';

class EloanConfirmPage extends StatefulWidget {

  final String amount;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String pin;

  const EloanConfirmPage({super.key, required this.amount, required this.firstName, required this.lastName, required this.phoneNumber, required this.pin});

  @override
  State<EloanConfirmPage> createState() => _EloanConfirmPageState();
}

class _EloanConfirmPageState extends State<EloanConfirmPage> with TickerProviderStateMixin {



  late AnimationController controller= AnimationController(
    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {

    if(controller.value>=1){

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F8),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: AppLayout.getScreenHeight(),width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Confirm Your Loan',
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle,size: 60,color: Colors.grey.shade200,),
                  title: Text('${widget.firstName}${widget.lastName}'),
                  subtitle: Text(widget.phoneNumber),
                ),
                Divider(color:  Color(0xFFFFF8F8),thickness: 5,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: AppLayout.getHeight(70),width: AppLayout.getWidth(320),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Received Amount',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                              Text('৳${widget.amount}.00',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  //fontSize: 16
                                ),
                              ),
                              Text('৳${widget.amount}.00-৳69.00',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('New Balance',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                              Text('৳5,960.53',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color:  Color(0xFFFFF8F8),thickness: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: AppLayout.getHeight(60),width: AppLayout.getWidth(320),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Took a E-Loan',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),),
                              Text('৳${widget.amount}.00', style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                //fontSize: 16
                              ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Giving E-Loan',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                              Container(
                                height: 40,width: 50,
                                  child: Image.asset('assets/images/paymentsAll_logo.png',)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color:  Color(0xFFFFF8F8),thickness: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: AppLayout.getHeight(70),width: AppLayout.getWidth(320),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Payable',
                                style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                //fontSize: 16
                              ),),
                              Text('৳${widget.amount}.90',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  //fontSize: 16
                                ),),
                              Text('৳${widget.amount}.00+৳50.90',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Loan Payment Deadline',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                              Text('Every Months 11th',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  //fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xFFFFF8F8),
                    color: Color(0xFFF59191),
                    minHeight: 8,
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',

                  ),
                ),

                Center(
                  child: InkWell(
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
                            return LoanSuccessfulPage(
                              amount: widget.amount,
                              firstName: widget.firstName,
                              lastName: widget.lastName,
                              phoneNumber: widget.phoneNumber,
                              pin: widget.pin,);
                          },
                        ),
                      );
                      //nav = Navigator.of(context);
                     // Navigator.of(context).pop();
                     // Navigator.of(context).pop();
                      // Navigator.pushAndRemoveUntil(
                      //     context, MaterialPageRoute(builder: (context) => LoanSuccessfulPage()), (
                      //     route) => false);
                    },
                    child: Container(
                      padding: EdgeInsets.all(40),
                      margin: EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.all(
                            Radius.circular(70.0)), // Set rounded corner radius
                      ),

                      child: Text("Tap to Confirm",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                    onTapUp: (detail) {
                      controller.stop();

                      // Fluttertoast.showToast(
                      //     msg: controller.value.toString(),
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0
                      // );
                      controller.reset();

                    },

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
