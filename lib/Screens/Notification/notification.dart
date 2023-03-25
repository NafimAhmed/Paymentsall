// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// class NotificationTrigger extends StatefulWidget {
//   const NotificationTrigger({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationTrigger> createState() => _NotificationTriggerState();
// }
//
// class _NotificationTriggerState extends State<NotificationTrigger> {
//   @override
//   void initState() {
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed){
//
//       if(!isAllowed)
//       {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//
//     });
//     super.initState();
//
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
//
//   triggerNotification()
//   {
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: 10,
//             channelKey: 'basic_channel',
//             title: '',
//             body: 'this is notification body'
//         )
//     );
//   }
//
// }
