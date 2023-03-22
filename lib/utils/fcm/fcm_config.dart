//
// import 'dart:convert';
//
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:etr/utils/fcm/push_notfi.dart';
// import 'package:etr/utils/storage.dart';
//
//
//
// firebaseMessagingIni()async{
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   String  token = await  messaging.getToken() ;
//   setToken(token) ;
//   //
//   print(token) ;
// }
//
// startFCMlisten()async{
//
//   RemoteMessage initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//   if(initialMessage!=null){
//     onSelectNotification(jsonEncode(initialMessage.data));
//   }
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//
//     if(message.data!=null&& message.data.isNotEmpty){
//       onSilent(jsonEncode(message.data));
//     }
//
//     if (message.notification != null) {
//       showNotification(0, message.notification.title,  message.notification.body,jsonEncode(message.data));
//
//     }
//   });
//
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//
//     // showCustomFlash(text: message.data.toString());
//     onSelectNotification(jsonEncode(message.data));
//
//   });
//
// }
//
