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

    Query dbref=FirebaseDatabase.instance.ref("User_profile").child(widget.phoneNumber).child("Notifications");


    dbref.onValue.listen((event) {
      triggerNotification();
    });


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

                  String prep=" ";
                  if(snapshot.child("transection_type").value.toString()=="Sent")
                  {
                    prep="Send to : ";
                  }
                  else if(snapshot.child("transection_type").value.toString()=="Received"){
                    prep="Received from : ";
                  }


                  return Card(
                    color: Colors.red.shade50 ,
                    //color: Color(0xFFF6F3FD),
                    elevation: 0.0,
                    child: ListTile(
                      onTap: (){

                      },
                      leading: Image.asset('assets/images/Payments_All.png'),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${snapshot.child("type").value.toString()}',
                          style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          ),
                          ),
                          Text('${snapshot.child("time").value.toString()}',
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
                            TextSpan(text: 'Tk has been successfully ${prep}',
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w300
                            ),
                            ),
                            TextSpan(text: ' ${snapshot.child("opponent").value.toString()}',style: GoogleFonts.openSans(
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



                    ),
                  );

                },

              ),
            )




















          ],
        ),
      ),



    );
  }





            triggerNotification()
            {
              AwesomeNotifications().createNotification(
                  content: NotificationContent(
                      id: 10,
                      channelKey: 'basic_channel',
                      title: 'Simple Notification',
                      body: 'this is notification body'
                  )
              );
            }




            @override
            void initState() {


              AwesomeNotifications().isNotificationAllowed().then((isAllowed){

                if(!isAllowed)
                {
                  AwesomeNotifications().requestPermissionToSendNotifications();
                }

              });
              super.initState();

              //
              // rf.child("notification").onChildAdded.listen((event) {
              //   showNotification(event.snapshot.value);
              // });
            }

           Future<void>onSelectNotification(String payload)async{

           }

           Future<void>showNotification(String data)async{

           }

}
