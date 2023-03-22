import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/controllers/controler_button.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/styles.dart';

class DefaultButton extends StatefulWidget {

 final Color background ;
 final Color textColor ;
 final double fontSize;
 final double radius;
 final bool isExpanded ;
 final Function() onPressed;
 final String text;
 final ButtonController controller;
 // bool isBorder = false;
 // bool isShadow = true;
 // bool toUpper = true;
 //  bool isFittedText = false;
 // bool iconEnd = false;
  String icon;
 // double height;


   DefaultButton({
    @required this.onPressed,
    @required this.text,
    this.background = fSecondaryColor,
    this.textColor = Colors.white,
    this.fontSize,
    this.radius,
    this.isExpanded = true, this.controller,

     this.icon,
   // this.height,
   // this.isBorder = false,
   // this.isFittedText = false,
   // this.isShadow = true,
   // this.toUpper = true,
   // this.iconEnd = false,
  }) ;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {

  bool isLoader = false  ;
  setIsLoader(val){
    setState(() {
      isLoader = val ;
    });
  }

  @override
  void initState() {
    if(widget.controller!=null){
      widget.controller.setIsLoader = setIsLoader ;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: elevatedButtonStyle(color: widget.background,radius: widget.radius),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: widget.isExpanded?  MainAxisSize.max:MainAxisSize.min,
          children: [
            if(isLoader) ...[Container(height: 20.w ,width: 20.w,child: const CircularProgressIndicator(color: Colors.white,)),SizedBox(width: 5.w,)] ,
            myText(
               widget.text,
              textAlign: TextAlign.center,
              icon: widget.icon??'',
              color: widget.textColor,
              fontSize: widget.fontSize??18.sp,
              isBold: true
            )
          ],
        ),
      ),
    );
  }
}