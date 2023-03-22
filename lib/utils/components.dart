import 'dart:ffi';
import 'dart:io';

import 'package:etr/screens/home_screen.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:etr/app_notifier.dart';
// import 'package:etr/screens/home_screens/home_screen.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/fcm/fcm_config.dart';
import 'package:etr/utils/fcm/push_notfi.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/styles.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:exif/exif.dart';
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


SharedPreferences preferences;
//TODO change to false when start api
bool isAppTestMode = false ;
void initApp() async{
  dioHelperIni();
  // await Firebase.initializeApp(
  //   // options: DefaultFirebaseOptions.currentPlatform,
  // );
   pluginIni();
   // await firebaseMessagingIni();

}










List<BoxShadow> boxShadow ({int color=300,double blurRadius = 9}) => [
      BoxShadow(color: Colors.grey[color], offset: Offset(0, 0), blurRadius: blurRadius),
    ];
List<BoxShadow> boxShadowColor ({int colors=200,Color color = Colors.grey,double blurRadius = 12}) => [
  BoxShadow(color: color, offset: Offset(0, 0), blurRadius: blurRadius),
];
get boxDecoration => BoxDecoration(
  color: fWhite,
    borderRadius: BorderRadius.circular(
       20.r,

    ),
   boxShadow:   boxShadow()
   // border: Border.all(color: fSecondaryColor ,width: 1),
   );





List socialList;

Widget buildCloseButton(Function function)=>  InkWell(
  onTap:function ,
    child: Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Icon(Icons.close,color: fPrimaryColor,),
    )) ;



Widget buildSettingItem({@required title, @required function}) => Column(
      children: [
        SizedBox(
          height: 1.0,
        ),
        ListTile(
          tileColor: Colors.white,
          onTap: function,
          title: Text(
            title.toString(),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.0,
          ),
        ),
      ],
    );

Widget customCheck(bool, Function onChange , {Color color = fPrimaryColor}) => InkWell(
      onTap: onChange,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: color,
            )),
        child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Visibility(
              visible: bool,
              child: Icon(
                Icons.circle,
                size: 12.0,
                color: color,
              ),
              replacement: Icon(
                Icons.check,
                size: 15.0,
                color: Colors.transparent,
              ),
            )),
      ),
    );



Widget defaultTextForm(
  TextEditingController controller,
  String hint, {
  Widget icon,
  bool isPassword = false,
  Function validator,
  String defaultValidator,
  TextInputType type = TextInputType.text,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      //  color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            border: InputBorder.none,
            hintText: hint,

            hintStyle: defaultTextStyleHint(),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? Container(),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            //icon:icon ,
            prefixIconConstraints:
                BoxConstraints(minWidth: 30.w, minHeight: 30.w)),
        validator: validator ??
            (str) {
              return defaultValidator;
            },
        keyboardType: type,
      ),
    );


Widget defaultTextFormDialog(
    TextEditingController controller,
    String hint, {
      Function onTap ,
      Widget icon,
      bool isPassword = false,
      bool isBorder = false ,
      Function validator,
      String defaultValidator,
      TextAlign textAlign =TextAlign.start,
      TextInputType type = TextInputType.text,
      size
    }) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        border:isBorder? Border.all(color: fSecondaryColor):null
        //  color: Colors.white,
      ),
      //padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: TextFormField(
        onTap:onTap ,
        showCursor:onTap==null,
        readOnly: onTap!=null ,
        controller: controller,
        obscureText: isPassword,
        textAlign:textAlign ,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: defaultTextStyleHint(),
            prefixIcon:icon!=null? Padding(
              padding:  EdgeInsetsDirectional.only(start: 10.w ,end: 5.w),
              child: icon,
            ): null ,
            // prefixIcon: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     // icon ?? Container(),
            //     // SizedBox(
            //     //   width: 10.w,
            //     // )
            //   ],
            // ),
            //icon:icon ,
            prefixIconConstraints:icon!=null? BoxConstraints(minWidth: 30.w, minHeight: 25.w,):null
        ),
        validator: validator ??
                (str) {
              return defaultValidator;
            },
        keyboardType: type,
      ),
    );


Widget textBodyMedium(String text,
        {isBold = false,
        double fontSize,
        Color color = Colors.white,
        FontWeight fontWeight ,
        TextAlign textAlign = TextAlign.center}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 22.sp,
        color: color,
        fontWeight: fontWeight==null? isBold ? FontWeight.w900 : FontWeight.w600:fontWeight,
      ),
    );

Widget textBodyBigSkinny(String text,
    {isBold = false,
      double fontSize,
      Color color = fPrimaryColor,
      TextAlign textAlign = TextAlign.center}) =>
    textBodyMedium(text,color:color ,fontWeight: FontWeight.w600, fontSize: fontSize ?? 20.sp ,isBold: isBold  ,textAlign: textAlign );

Widget myText(String text,
    {
      isBold = false,
      bool isAutoDirection = true,
      Color color = fBlack,
      FontWeight fontWeight,
      double fontSize ,
      double iconSize ,
      int maxLine ,
      String icon='' ,
      TextDecoration textDecoration = TextDecoration.none ,
      TextAlign textAlign = TextAlign.start}) =>
    Wrap(
      //  mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if(icon.isNotEmpty)svgImage(icon,size:iconSize==null?fontSize!=null? fontSize-3: 15:iconSize,color: color),
        if(icon.isNotEmpty)SizedBox(width: 10.w,),
        if(isAutoDirection)
          AutoDirection(
            text: text.toString()??'',
            child: Text(
              text??'-',
              textAlign: textAlign,
              maxLines: maxLine,
              /*overflow: TextOverflow.ellipsis,*/
              style: TextStyle(
                decoration: textDecoration,
                fontSize:fontSize?? 16.sp,
                color: color,
                height: 1.3,
                fontWeight:fontWeight?? (isBold ? FontWeight.w700 : FontWeight.w400),
              ),
            ),
          )
        else
          Text(
            text??'-',
            textAlign: textAlign,

            /*overflow: TextOverflow.ellipsis,*/
            style: TextStyle(
              decoration: textDecoration,
              fontSize:fontSize?? 16.sp,
              color: color,
              fontWeight:fontWeight?? (isBold ? FontWeight.w700 : FontWeight.w400),
            ),
          ),


      ],
    );

Widget textDetails(String text,
        {isBold = false,
        int maxline = 2,
        isLimit = true  ,
        Color color = Colors.white,
          double fontSize,
        TextAlign textAlign = TextAlign.center}) =>
    Text(
      text,
      textAlign: textAlign,
      maxLines:isLimit?maxline :null ,
      softWrap: true,
      overflow:isLimit?TextOverflow.ellipsis :null ,
      style: TextStyle(
        fontSize: fontSize??12.sp,
        color: color,
        fontWeight: isBold ? FontWeight.w900 : FontWeight.w600,
        textBaseline: TextBaseline.alphabetic,
      ),
    );

// Widget ratingBar(double initialRating, {Function onRatingUpdate ,bool ignoreGestures =false,double itemSize = 18 ,Function customDesign}) =>
//     RatingBar.builder(
//       initialRating: initialRating??0,
//       minRating: 1,
//       direction: Axis.horizontal,
//       allowHalfRating: false,
//       itemCount: 5,
//       ignoreGestures:ignoreGestures ,
//       //itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
//       itemSize: itemSize,
//       itemBuilder: (context, i) =>customDesign ==null? const Icon(
//         Icons.star,
//         color: fYellow,
//       ):customDesign(i),
//
//       onRatingUpdate: onRatingUpdate,
//     );


Widget detailsText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 20.sp,
      ),
    );

Future To(BuildContext context, Widget widget) async {
  return await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => widget));
}
 ToUrl(String url2) async {
   Uri url = Uri.parse(url2);
   if (await canLaunchUrl(url)) {
     await launchUrl(url);
   } else {
     throw 'Could not launch $url';
   }
}

Future ToWithFade(BuildContext context, Widget widget) async {


  return await Navigator.of(context).push( PageRouteBuilder(
    pageBuilder: (c, a1, a2) =>widget,
    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
    transitionDuration: Duration(milliseconds: 1000),
  ),);
}
Future ToRemove(BuildContext context, Widget widget) async {
  return await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => widget));
}
Future toRemoveAll(BuildContext context, Widget widget) async {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (_) => false);
  //return await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => widget));
}


Future goHome(BuildContext context, {bool isFirst = false}) async {
  if(isFirst){
    // Provider.of<AppNotifier>(context,listen: false).createClient(context);
    // Provider.of<AppNotifier>(context,listen: false).handleListen();
  }
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (_) => false);
  //return await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => widget));
}
void buildProgress({
  context,
  text,
  bool error = false,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20.0,
                  ),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
            if (error)
              SizedBox(
                height: 20.0,
              ),
            if (error)
              DefaultButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'cancel',
              )
          ],
        ),
      ),
    );

Widget svgImage(
  icon, {
  Color color,
  double size,
  double width,
      BoxFit fit= BoxFit.contain
}) =>
    SvgPicture.asset(
      'assets/images/$icon.svg',
      color: color,
      height: size,

      width:width?? size,
      fit: fit,

    );
Widget myImage(
    icon, {
      double height,
      double width,
      BoxFit fit= BoxFit.fill
    }) =>
    Image.asset(
      'assets/images/$icon.png',
      height: height,
      width:width,
      fit: fit,

    );
Widget myAppBar(title , {Widget widget , actions,centerTitle = false,backgroundColor = fPrimaryColor}) => AppBar(
      centerTitle: centerTitle,
      leading: widget,
      backgroundColor: backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleSpacing: 0,
      actions: actions,
      elevation: 0,
      title: Text(
        title,
         style: TextStyle(color: backgroundColor!=fWhite?fWhite:fSecondaryColor),
      ),
    );


Widget divider({bool withPadding =true}){
 return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:withPadding? 20.w:0, vertical: 10.h),
        color: fBlack,
        width: ScreenUtil().screenWidth * 0.5,
        height: 0.5,
      ));
}
// Widget createSearchView(TextEditingController controller) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 10.w),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         border: Border.all(width: 1.0 ,color: fkSecondaryColor) ),
//     child: Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               // fillColor: fkSecondaryColor3,
//               // filled: true,
//               border: InputBorder.none,
//               hintText: 'hintSearch'.t,
//
//               /*suffixIcon: Icon(Icons.search, color: fkPrimaryColor)*/
//               hintStyle: TextStyle(color: fkSecondaryColor, fontSize: 15.sp,),
//             ),
//             textAlign: TextAlign.start,
//           ),
//         ),
//         svgImage('mark' , size: 25.h)
//       ],
//     ),
//   );
// }

Widget imageNet(String url,{BoxFit fit =BoxFit.cover})=>  CachedNetworkImage(imageUrl: url,
  placeholder: (context, url) => SpinKitFadingCube(
    color: fPrimaryColor,
    size: 50.0,
  ),
  errorWidget: (context, url, error) => Container(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10)
    ),
      child: Icon(Icons.image_not_supported,color: Colors.grey[200],)),
  fit:BoxFit.cover ,);


Widget imageCircle(image,{File file, double radius, bool isOnLine = true ,}) {

 double size= radius !=null? radius*2:null ;
 double sizePoint= radius !=null? radius/2:null ;
  return Center(
    child: CircleAvatar(

       backgroundColor: Colors.transparent,
       maxRadius: radius ?? 60.r,

       child:ClipOval(
           clipBehavior: Clip.hardEdge,
           child:file!=null?Image.file(file, height:size?? 60.r,
             width:size?? 60.r,
             fit: BoxFit.cover,) : CachedNetworkImage(imageUrl: image,
               height:size?? 60.r,
               width:size?? 60.r,
               fit: BoxFit.cover,
               errorWidget:(context,fsf,fs){
               return Container(
                 color: Colors.grey[200],
                   child: Icon(Icons.person,color: Colors.blueAccent,size: (size?? 60.r)-20,));
               },
               placeholder: (context, url) => SpinKitDoubleBounce(
                 color: fPrimaryColor,
                 size: 50.0,
               )) ,
       /*backgroundImage: NetworkImage(
           *//* history.driver!=null? history.driver.avatar:*//*
           Image,),*/
       )),
  );
}
Widget imageRadius(image, {double radius, bool isOnLine = true ,}) {
  double size= radius !=null? radius*3:null ;
  double sizePoint= radius !=null? radius/2:null ;
  return Container(
    child: Stack(
      children: [
        Container(
            clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 15.r)
          ),
            child:CachedNetworkImage(imageUrl: image,
                height:size?? 50.r,
                width:size?? 50.r,
                fit: BoxFit.cover,
                placeholder: (context, url) => SpinKitDoubleBounce(
                  color: fPrimaryColor,
                  size: 50.0,
                ))),
        // PositionedDirectional(
        //   bottom: 0,
        //   end: 0,
        //   child: Container(
        //     height: sizePoint??15.w,
        //     width: sizePoint??15.w,
        //     decoration: BoxDecoration(
        //       //  borderRadius: BorderRadius.circular(5),
        //       border: Border.all(color: Colors.white, width: 2),
        //       color: isOnLine ? Colors.green : Colors.grey,
        //       shape: BoxShape.circle,
        //     ),
        //   ),
        // )
      ],
    ),
  );
}
void showToast({
  @required text,
  @required error,
}) =>
    Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

/*Widget divider(text ,{bool isShowBtn = false ,Function onTap}) => Container(
  margin: EdgeInsets.symmetric(vertical: 10.h),
  padding: EdgeInsets.symmetric(vertical: 10.h),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w , end: 10.w),
        child: Row(
          children: [
            textBody(text, color: fkSecondaryColor),
            Spacer(),
            Visibility(
                visible: isShowBtn,
                child: InkWell(
                    onTap:onTap ,
                    child: textBody('view_all'.t, color: fkPrimaryColor))),
          ],
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Divider(
        height: 1.h,
        color: fkSecondaryColor,
        thickness: 1,
      ),
    ],
  ),
);*/

/*Widget buildRowSearch({Function onFilter ,Function onHelp ,Function onMap , }){
  return  Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: DefaultButton(
          // fontSize: 20.sp,
            isShadow: false,
            isExpanded: false,
            toUpper: false,
            isFittedText: true,
            iconEnd: true,
            icon: svgImage('funnel',color: Colors.white),
            onPressed:onFilter,
            text:'filter'.t ,
            height: 40.h),
      ),
      SizedBox(width: 10.w,),
      Expanded(
        child: DefaultButton(
          // fontSize: 20.sp,
            isShadow: false,
            isExpanded: false,
            toUpper: false,
            iconEnd: true,
            isFittedText: true,
            onPressed:onHelp,
            icon: svgImage('help',color: Colors.white),
            text:'help'.t ,
            height: 40.h),
      ),
      SizedBox(width: 10.w,),
      Expanded(
        child: DefaultButton(
          // fontSize: 20.sp,
            isShadow: false,
            isExpanded: false,
            toUpper: false,
            isFittedText: true,
            iconEnd: true,
            onPressed:onMap,
            icon: svgImage('map',color: Colors.white),
            text:'map'.t ,
            height: 40.h),
      ),
    ],
  ) ;
}*/






/*class FlutterSliderCustom extends StatefulWidget {
  Function(int handlerIndex, dynamic lowerValue, dynamic upperValue) onDragging ;

   FlutterSliderCustom({Key key, this.onDragging}) : super(key: key);

  @override
  _FlutterSliderCustomState createState() => _FlutterSliderCustomState();
}

class _FlutterSliderCustomState extends State<FlutterSliderCustom> {
  double _lowerValue = 50;
  double _upperValue = 180;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100.h,
      child: FlutterSlider(
        values: [_lowerValue, _upperValue],
        max: 200,
        min: 50,

        maximumDistance: 300,
        rangeSlider: true,
        rtl: true,
        handlerHeight: 20.w,
        handlerWidth: 20.w,
        rightHandler: getThumb,
        handler: getThumb,

        tooltip: FlutterSliderTooltip(
          alwaysShowTooltip: true,


        ),
        handlerAnimation: FlutterSliderHandlerAnimation(
            curve: Curves.elasticOut,
            reverseCurve: null,
            duration: Duration(milliseconds: 700),
            scale: 1.4),
        onDragging: (handlerIndex, lowerValue, upperValue) {
          _lowerValue = lowerValue;
          _upperValue = upperValue;
          widget.onDragging(handlerIndex,lowerValue,upperValue) ;
          setState(() {});
        },
      ),
    );
  }


  FlutterSliderHandler get getThumb => FlutterSliderHandler(
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50)
    ),
    child: Icon(
      Icons.circle,
      color: Colors.white,
      size: 18,
    ),
  );
}*/



/*
Widget defaultButton({
  Color background = fkPrimaryColor,
  Color textColor = Colors.white,
  double fontSize,
  double radius,
  Widget icon,
  double height,
  bool isExpanded = true,
  @required Function onPressed,
  @required String text,
  bool isBorder = false,
  bool isShadow = true,
  bool toUpper = true,
}) => Container(
      width: isExpanded ? double.infinity : null,
      height: height ?? 50.h,
      decoration: BoxDecoration(
          color: isBorder ? Colors.white : background,
          borderRadius: BorderRadius.circular(
            radius ?? 10.r,
          ),
          border: isBorder ? Border.all(color: background) : null,
          boxShadow:isShadow? [
             BoxShadow(color: Colors.black38, offset: Offset(2, 2), blurRadius: 2),
          ]:null
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation:MaterialStateProperty.all<double>(0) ,
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.white.withOpacity(0.20);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.white.withOpacity(0.20);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null ? icon : Container(),
            icon != null
                ? SizedBox(
                    width: 10.w,
                  )
                : Container(),
            Text(
              toUpper ? text.toUpperCase() : text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize ?? 15.sp,
                color: isBorder ? background :textColor ,
              ),
            ),
          ],
        ),
      ),
    );
*/
extension Translation on String {
  String get t => tr(this) ?? this;
}


extension TimeOfDayExtension on TimeOfDay {
  // Ported from org.threeten.bp;
  TimeOfDay plusMinutes(int minutes) {
    if (minutes == 0) {
      return this;
    } else {
      int mofd = this.hour * 60 + this.minute;
      int newMofd = ((minutes % 1440) + mofd + 1440) % 1440;
      if (mofd == newMofd) {
        return this;
      } else {
        int newHour = newMofd ~/ 60;
        int newMinute = newMofd % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }



}
Future<XFile> getImageRe(ImageSource re)async{

  return await ImagePicker().pickImage(source:re );

}


Future<File> fixExifRotation(String imagePath) async {

  return await FlutterExifRotation.rotateImage(path: imagePath);
  final originalFile = File(imagePath);
  List<int> imageBytes = await originalFile.readAsBytes();

  final originalImage = img.decodeImage(imageBytes);

  final height = originalImage.height;
  final width = originalImage.width;

  // Let's check for the image size
  // This will be true also for upside-down photos but it's ok for me
  if (height >= width) {
    // I'm interested in portrait photos so
    // I'll just return here
    return originalFile;
  }

  // We'll use the exif package to read exif data
  // This is map of several exif properties
  // Let's check 'Image Orientation'
  final exifData = await readExifFromBytes(imageBytes);

  img.Image fixedImage;

  if (height < width) {
    // rotate
    if (exifData['Image Orientation'].printable.contains('Horizontal')) {
      fixedImage = img.copyRotate(originalImage, 90);
    } else if (exifData['Image Orientation'].printable.contains('180')) {
      fixedImage = img.copyRotate(originalImage, -90);
    } else if (exifData['Image Orientation'].printable.contains('CCW')) {
      fixedImage = img.copyRotate(originalImage, 180);
    } else {
      fixedImage = img.copyRotate(originalImage, 0);
    }
  }

  // Here you can select whether you'd like to save it as png
  // or jpg with some compression
  // I choose jpg with 100% quality
  final fixedFile =
  await originalFile.writeAsBytes(img.encodeJpg(fixedImage));

  return fixedFile;
}