

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:etr/utils/NavigationService.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/my_colors.dart';


// // ||... method for showing an message ...||
//  void showMessage(String message, MessageType messageType) {
//   if (message == null) return;
//   if (messageType == MessageType.MESSAGE_FAILED)
//     BotToast.showNotification(
//       duration: Duration(seconds: 2),
//       trailing: (_) => Icon(
//         Icons.arrow_forward_ios,
//         color: Colors.red,
//       ),
//       title: (_) => Text(
//         'Failed'.tr,
//         style: TextStyle(color: Colors.red),
//       ),
//       subtitle: (_) => Text(
//         message,
//         style: TextStyle(color: Colors.red),
//       ),
//       leading: (_) => Icon(
//         Icons.error,
//         color: Colors.red,
//       ),
//     );
//
//
// }



showMessage(){
  BotToast.showWidget(

    toastBuilder: (cancelFunc) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w,).copyWith(top: 80.h),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            color: fWhite,
            boxShadow: boxShadow()
        ),
        child: Row(
          children: [svgImage('warning'),
            SizedBox(width: 10.w,),
            Expanded(
              child: myText('Invoice not paid. please wait until patient pay it')),
            IconButton(onPressed: (){BotToast.cleanAll();}, icon: Icon(Icons.close))],

        ),
      ),
    );
  },) ;
}
//||... shortcut for showing bottom sheet ...||
Future<dynamic> bottomSheet({
  @required BuildContext context,
  @required Widget child,
  Color backgroundColor=fWhite,
  double radius = 30,
  bool isScrollControlled = true,
}) async {
  // FocusScope.of(context).unfocus();
  return await showModalBottomSheet(
    context: context,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius.r),
      ),
    ),
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor,
    builder: (_) => child,
  );
}

Future<dynamic> showCustomDialog(BuildContext context, Widget widget) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      content: widget,
    ),
  );
}


Future<dynamic> showConfirmDialog(BuildContext context,{String title }) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.all(15.w),
      contentPadding: EdgeInsets.all(15.w),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      actions: [
        TextButton(onPressed:(){Navigator.pop(context,true);} , child: myText('Yes'.t,color:fPrimaryColor)),
        TextButton(onPressed:(){Navigator.pop(context,false);} , child: myText('No'.t,color: fPrimaryColor)),
      ],

      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: myText(title??'messageDelete'.t,fontSize: 18.sp,color:fBlack ),
      ),
    ),
  )??false;
}
String stringFromList(List<dynamic> list, Function(dynamic) handle) {
  try {
    String text = list.map((e) => handle(e)??e.name).toList().toString();
    return text.substring(1, text.length - 1);
  } catch (e, s) {
    print(s);
    return 'non';
  }
}

//||... email validator ...||
bool isEmail(String text) => RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(text);

//||... mobile validator ...||
bool isMobile(String text) => text.length >= 8 && text.length <= 12;

//||... url validator ...||
bool isUrl(String text) => RegExp(
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
    .hasMatch(text);

showCustomFlash(
    {@required String text,
    bool persistent = true,
    EdgeInsets margin = const EdgeInsets.only(bottom: 30, left: 10, right: 10),
    MessageType messageType = MessageType.MESSAGE_FAILED}) {
  showFlash(
    context: NavigationService.navigatorKey.currentContext,
    persistent: persistent,
    duration: Duration(seconds: 3),
    builder: (_, controller) {
      return Flash(
        position: FlashPosition.bottom,
        controller: controller,
        margin: margin,
        borderRadius: BorderRadius.circular(8.0),
        boxShadows: kElevationToShadow[8],
        backgroundColor: messageType == MessageType.MESSAGE_SUCCESS
            ? Colors.green
            : Colors.red,
        onTap: () => controller.dismiss(),
        forwardAnimationCurve: Curves.ease,
        reverseAnimationCurve: Curves.bounceIn,
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: FlashBar(
            message: myText(text, color: fWhite, fontSize: 14.sp),
            //   leftBarIndicatorColor: Colors.red,
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            primaryAction: MaterialButton(
              onPressed: () => controller.dismiss(),
              child: Text(
                'DISMISS',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    },
  ).then((_) {
    if (_ != null) {
      //  _showMessage(_.toString());
    }
  });
}

// ||... format date ...||
String formatDate(DateTime dateTime, {bool withTime = false , bool withDate =true,bool forApi=false}) {
  if (dateTime == null) return null;
  if (withTime&&withDate) {
    if(forApi){
      return DateFormat('yyyy-MM-dd  HH:mm', 'en').format(dateTime);
    }else{
      return DateFormat('dd-MMMM-yyyy  hh:mm a', 'en').format(dateTime);
    }

  } else if(withTime){

    if(forApi){
      return DateFormat('HH:mm', 'en').format(dateTime);
    }else{
      return DateFormat('hh:mm a', 'en').format(dateTime);
    }

  }else{
    if(forApi){
      return DateFormat('yyyy-MM-dd', 'en').format(dateTime);
    }else{
      return DateFormat('dd-MM-yyyy', 'en').format(dateTime);
    }
    return DateFormat('dd-MM-yyyy','en').format(dateTime);
  }
}

String formatDateNum(DateTime dateTime, {bool withTime = false}) {
  if (dateTime == null) return null;
  if (withTime)
    //January 06, 2021
    return DateFormat('yyyy-MM-dd HH:mm', 'en').format(dateTime);
  else
    return DateFormat('yyyy-MM-dd', 'en').format(dateTime);
}

DateTime stringToDate(String dateTime,) {

    //January 06, 2021
    return  DateTime.parse(dateTime ) ;

}
TimeOfDay stringToTimeOfDay(String s) {



  return TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));

}

Iterable<TimeOfDay> getTimeSlots(String startTimeStr, String endTimeStr, Duration interval) sync* {
  TimeOfDay startTime = stringToTimeOfDay(startTimeStr) ;
  TimeOfDay endTime = stringToTimeOfDay(endTimeStr) ;
  var hour = startTime.hour;
  var minute = startTime.minute;

  do {
    yield TimeOfDay(hour: hour, minute: minute);
    minute += interval.inMinutes;
    while (minute >= 60) {
      minute -= 60;
      hour++;
    }
  } while (hour < endTime.hour || (hour == endTime.hour && minute <= endTime.minute));
}
// ||... format time ...||
String formatTime(TimeOfDay timeOfDay) {
  if (timeOfDay == null) return null;
  return '${timeOfDay.hour < 10 ? '0${timeOfDay.hour}' : timeOfDay.hour}:${timeOfDay.minute < 10 ? '0${timeOfDay.minute}' : timeOfDay.minute}';
}

Future<DateTime> selectDate(BuildContext context, {bool future = false}) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate:future ? DateTime.now(): DateTime(1970),
    lastDate:future?DateTime.now().add(const Duration(days: 365*2)): DateTime.now(),
  );
}

Future<TimeOfDay> selectTime(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),

  );
}
void scrollToBottom(ScrollController controller) {
  Timer(Duration(milliseconds: 200), () {
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    final bottomOffset = controller.position.maxScrollExtent ;
    controller.animateTo(
      bottomOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  });
}


String formatDateWords(DateTime dateTime){
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);


  final dateToCheck = dateTime ;
  final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
  if(aDate == today) {
  return 'today'.t;
  } else if(aDate == yesterday) {
    return 'yesterday'.t;
  } else if(aDate == tomorrow) {
    return 'tomorrow'.t;
  }
  return formatDate(dateTime,withTime: false);
}

String calculateAge(DateTime barthDate){
 Duration duration =  DateTime.now().difference(barthDate) ;
 return (duration.inDays /365).toInt().toString() ;
}
Future getMultipart(File file)async{
  return file!=null? await MultipartFile.fromFile(file?.path,) :null;
}
// static callNumber(String number)async {
//   // const number = '08592119XXXX'; //set the number here
//   bool res = await FlutterPhoneDirectCaller.callNumber('00$number');
// }
