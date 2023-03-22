import 'package:etr/utils/storage.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:etr/utils/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';

class MyTextFailed extends StatefulWidget {
  final TextEditingController controller;

  final Function onTap;

  final Widget icon;

  final String hint;

  final bool isUnderLine;

  final bool withTitle;

  final bool isPassword;

  final bool isMobile;

  final bool isRequired;

  final int maxLines;

  final int maxLength;

  final int minLines;

  final Color titleColor;

  final Color backGround;

  final Function(String) validator;

  final TextInputType textInputType;

  final double marginTop;

  final TextInputAction textInputAction;

  final List<TextInputFormatter> inputFormatters;

  const MyTextFailed(
      {Key key,
      this.controller,
      this.onTap,
      this.icon,
      this.hint,
      this.textInputAction = TextInputAction.next,
      this.isUnderLine = false,
      this.withTitle = false,
      this.maxLines = 1,
      this.maxLength,
      this.titleColor = fTextColor,
      this.backGround = fBackGroundTextFailed,
      this.textInputType = TextInputType.text,
      this.validator,
      this.isPassword = false,
      this.marginTop,
      this.minLines,
      this.isMobile = false,
      this.inputFormatters,
      this.isRequired = true})
      : super(key: key);

  @override
  State<MyTextFailed> createState() => _MyTextFailedState();
}

class _MyTextFailedState extends State<MyTextFailed> {
  String text = '';
  bool isShowPassword = false;
  bool isRtl = false ;
  @override
  void initState() {
    isRtl =widget.isMobile||widget.isPassword||widget.textInputType==TextInputType.emailAddress ;
    // TODO: implement initState
    if(isRtl){
      text='en';
    }else{
      text = widget.hint;
    }

    super.initState();
  }
  List<TextInputFormatter> get format {

    if(widget.inputFormatters!=null){
      return widget.inputFormatters ;
    }else if(widget.textInputType ==TextInputType.number){
      return [
        FilteringTextInputFormatter.allow(RegExp('[0-9 ]')),
      ] ;
    }else{
      return null ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.marginTop ?? 0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: fWhite,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: fBorderColor)
          //boxShadow: boxShadow()
      ),
      child: AutoDirection(
        text: text,
        child: TextFormField(
          onTap: widget.onTap,
          showCursor: widget.onTap == null,
          readOnly: widget.onTap != null,
          maxLines: widget.maxLines,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          inputFormatters: format,
          minLines: widget.minLines,
          obscureText: widget.isPassword && !isShowPassword,
          validator: widget.validator ?? widget.isRequired
              ? (value) {
                  if (value.isEmpty) {
                    return 'fieldRequired'.t;
                  }
                  if (widget.isMobile) {
                    if (!isMobile(value)) {
                      return 'mobileValidMessage'.t;
                    }
                  }
                  if (widget.textInputType == TextInputType.emailAddress) {
                    if (!isEmail(value)) {
                      return 'The_email_is_invalid'.t;
                    }
                  }
                  return null;
                }
              : null,
          onChanged: (value) {
            if(isRtl) return ;
            setState(() {
              if(value.isNotEmpty){
                text = value;
              }else{
                text =widget.hint;
              }

            });
          },
          textAlign: TextAlign.start,
          style: widget.isUnderLine
              ? Theme.of(context).textTheme.headline4
              : Theme.of(context).textTheme.headline5,
          decoration: InputDecoration(
            hintText: widget.hint,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            fillColor: Colors.white,
            filled: true,
            hintStyle: const TextStyle(
                color: fTextColorLight, fontWeight: FontWeight.w600),
            border: /*widget.isUnderLine?UnderlineInputBorder(): */ OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none),
            suffixIcon: widget.onTap!=null?Icon(Icons.arrow_forward_ios,size: 15.r,color: fSecondaryColor,): widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: svgImage(isShowPassword
                          ? 'password_show'
                          : 'password_un_show'),
                    ))
                : null,
            prefixIcon: widget.icon != null
                ? Container(
                    width: 20.w,
                    height: 20.w,
                    padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                    child: Center(child: widget.icon),
                  )
                : null,
            // su:icon!=null? BoxConstraints(minWidth: 30.w, minHeight: 25.w,):null
          ),
        ),
      ),
    );
  }
}
