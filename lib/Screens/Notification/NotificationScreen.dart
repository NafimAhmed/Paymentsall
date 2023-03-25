import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_layout.dart';

class NotificationScreen extends StatefulWidget {
  final String phoneNumber;
  const NotificationScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {



  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("User_profile").child(widget.phoneNumber).child("notification");


    return Scaffold(
      appBar: AppBar(
        title: Text("Notification",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFF8F8),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Column(
          children: [




            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FirebaseAnimatedList(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                query: dbref,
                reverse: true,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                  return Card(
                    color: Colors.red.shade50 ,
                    //color: Color(0xFFF6F3FD),
                    elevation: 0.0,
                    child: ListTile(
                      leading: Image.asset('assets/images/Payments_All.png'),
                      title: Row(
                        children: [
                          Text('${snapshot.child("type").value.toString()}',
                          style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          ),
                          ),Spacer(),
                          Text('${DateFormat.yMd().format(DateTime.now()).toString()}',
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              //fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '${snapshot.child("amount").value.toString()} ',
                                style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold
                            )
                            ),
                            TextSpan(text: 'Tk has been successfully CashOut from',
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w300
                            ),
                            ),
                            TextSpan(text: ' ${widget.phoneNumber}',style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold
                            )
                            ),
                            TextSpan(text: ' account.',
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                      ),


                      // Text('${snapshot.child("amount").value.toString()} Tk has been successfully CashOut from ${widget.phoneNumber} account.',
                      //   style: GoogleFonts.openSans(
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.w300,
                      //     //fontSize: 16
                      //   ),
                      // ),
                    ),
                  );

                },

              ),
            )



















            // ListView.builder(
            //   itemCount: notifications.length,
            //     itemBuilder: (context, index){
            //     return ListTile(
            //       title: Text(notifications[index]),
            //     );
            //     })






            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: 10,
            //     itemBuilder: (BuildContext context,int index){
            //
            //       return InkWell(
            //         //onTap: triggerNotification,
            //         child: Container(
            //
            //           decoration: BoxDecoration(
            //               color: Colors.red.shade100,
            //               border: Border.all(
            //                 color: Colors.red.shade100,
            //               ),
            //               borderRadius: BorderRadius.all(Radius.circular(15))
            //           ),
            //
            //
            //           padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(10)),
            //           margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5),vertical: AppLayout.getHeight(10)),
            //
            //
            //          // margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10),vertical: AppLayout.getHeight(20)),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //
            //               Text("Notification Title",
            //                 style: GoogleFonts.openSans(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold
            //                 ),
            //               ),
            //
            //               Text("Notificaton Description",
            //
            //                   style: GoogleFonts.openSans(
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.normal
            //               ),
            //
            //               ),
            //
            //             ],
            //           ),
            //         ),
            //       );
            //
            //     }
            //
            // )
          ],
        ),
      ),



    );
  }



  //
  //
  // triggerNotification()
  // {
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 10,
  //           channelKey: 'basic_channel',
  //           title: 'Simple Notification',
  //           body: 'this is notification body'
  //       )
  //   );
  // }
  //
  //
  //
  //
  // @override
  // void initState() {
  //
  //
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed){
  //
  //     if(!isAllowed)
  //     {
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //
  //   });
  //   super.initState();
  //
  //   //
  //   // rf.child("notification").onChildAdded.listen((event) {
  //   //   showNotification(event.snapshot.value);
  //   // });
  // }

 // Future<void>onSelectNotification(String payload)async{
 //
 // }
 //
 // Future<void>showNotification(String data)async{
 //
 // }

}
