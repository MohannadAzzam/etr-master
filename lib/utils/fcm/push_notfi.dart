import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:etr/utils/NavigationService.dart';
import 'package:etr/utils/components.dart';

import 'package:provider/provider.dart';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin ;
pluginIni(){
  var initializationSettingsAndroid =  AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS =  IOSInitializationSettings();
  var initializationSettings =  InitializationSettings(
      android: initializationSettingsAndroid,iOS:  initializationSettingsIOS);

  flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  print('initState2');
}

Future<void> showNotification(
    int notificationId,
    String notificationTitle,
    String notificationContent,
    String payload, {
      String channelId = '1234',
      String channelTitle = 'Android Channel',
      String channelDescription = 'Default Android Channel for notifications',
      Priority notificationPriority = Priority.high,
      Importance notificationImportance = Importance.max,
    }) async {
  var androidPlatformChannelSpecifics =  AndroidNotificationDetails(
    channelId,
    channelTitle,
    channelDescription: channelDescription,
    playSound: true,
    importance: notificationImportance,
    priority: notificationPriority,
  );
  var iOSPlatformChannelSpecifics =  IOSNotificationDetails(presentSound: false,);

  var platformChannelSpecifics =  NotificationDetails(android: androidPlatformChannelSpecifics,iOS:  iOSPlatformChannelSpecifics);


  await flutterLocalNotificationsPlugin.show(
    notificationId,
    notificationTitle,
    notificationContent,
    platformChannelSpecifics,

    payload: payload,
  );
}
Future<dynamic> onSelectNotification(String payload) async {
  Map map = await jsonDecode(payload) as Map<String, dynamic>;
  int id = int.parse(map['target_id'].toString()??'0');
  // switch(map['msgType'].toString()){
  //   case 'order':
  //     To(NavigationService.navigatorKey.currentContext, OrderDetailsScreen(id: id,)) ;
  //     break ;
  //   case 'offer':
  //     To(NavigationService.navigatorKey.currentContext, OrderDetailsScreen(id: id,)) ;
  //
  //     break ;
  //
  // }

  print('onSelectNotification $payload');
}


Future<dynamic> onSilent(String payload) async {
  // Map map = await jsonDecode(payload) as Map<String, dynamic>;
  // int id = int.parse(map['target_id'].toString()??'0');
  // switch(map['msgType'].toString()){
  //   case '1':
  //   // To(NavigationService.navigatorKey.currentContext, AppointmentDetailsScreen(id:id ,));
  //     break ;
  //
  // }

  print('onSelectNotification $payload');
}
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   //showNotification(0, message.notification.title,  message.notification.body,jsonEncode(message.data));
//
//
//   onSelectNotification(jsonEncode(message.data));
//   print("Handling a background message: ${message.messageId}  ${message.data} ");
// }
