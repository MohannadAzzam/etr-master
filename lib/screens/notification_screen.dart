import 'dart:ui';
import 'package:etr/items/item_notification.dart';
import 'package:etr/module/my_notifications.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';



class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Future future;



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key:const ValueKey(1),
      appBar: myAppBar(
        'Notifications'.t,
        centerTitle: true
      ),
      body:ListPagination(
        url: apiMyNotifications,
        fun: (json) => MyNotifications.fromJson(json),
        buildItem: (item) => ItemNotifications(myNotifications:item ,)

      ),
    );
  }


}
