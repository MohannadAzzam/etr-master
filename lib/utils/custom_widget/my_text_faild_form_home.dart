import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:etr/utils/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:etr/utils/my_colors.dart';

class MyTextFailedFormHome extends StatefulWidget {

  final TextEditingController controller ;
  final Function onTap ;
  final Widget icon ;
  final String hint ;
  final String title ;
  final bool isUnderLine ;
  final bool withArrow;
  final bool isRequired;
  final int maxLines ;
  final int maxLength ;
  final int minLines ;
  final Color titleColor ;
  final Color backGround ;
  final Function(String) validator ;
  final Function(String) onChange ;
  final TextInputType textInputType ;
  final double marginTop ;
  final TextInputAction textInputAction ;


  const MyTextFailedFormHome({
    Key key,
    this.controller,
    this.onTap, this.icon, this.hint,this.textInputAction =TextInputAction.next,this.isUnderLine = false, this.maxLines = 1, this.maxLength, this.titleColor = fTextColor, this.backGround = fBackGroundTextFailed, this.textInputType = TextInputType.text, this.validator,  this.marginTop, this.minLines, this.title, this.withArrow=false, this.isRequired = true, this.onChange}) : super(key: key);

  @override
  State<MyTextFailedFormHome> createState() => _MyTextFailedFormHomeState();
}

class _MyTextFailedFormHomeState extends State<MyTextFailedFormHome> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.marginTop??0,),
        Row(
          children: [
            myText(widget.title,color: fPrimaryColor62),
            SizedBox(width: 5,),
            if(widget.isRequired)
              myText('*',color: Colors.red),
            Spacer(),
            if(widget.withArrow)
            Icon(Icons.arrow_forward_ios,size: 15,)
          ],
        ),
        AutoDirection(
          text: text,
          child: TextFormField(
            onTap:widget.onTap ,
            showCursor:widget.onTap==null,
            readOnly: widget.onTap!=null ,
            maxLines: widget.maxLines,

            textInputAction:widget.textInputAction ,
            maxLength: widget.maxLength,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            minLines: widget.minLines,

            validator: widget.validator?? (value) {
              if(value.isEmpty){
                return  'fieldRequired'.t ;
              }
              return null ;
            },
            onChanged: (value) {
              if(widget.onChange!=null){
                widget.onChange(value) ;
              }

              setState(() {
                text =value ;
              });
            },
            style: widget.isUnderLine?Theme.of(context).textTheme.headline4:Theme.of(context).textTheme.headline5,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 11.0),
                hintText: widget.hint,
               // contentPadding: EdgeInsets.symmetric(vertical: 0.h ,horizontal: 0.w),
                fillColor:  Colors.white,
                filled: true,
                isDense: true ,
                hintStyle:const TextStyle(color: fTextColorLight,fontWeight: FontWeight.w600),
                border:/*widget.isUnderLine?*/UnderlineInputBorder()/*: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none
                )*/,
               // prefixIcon: ,
           /*   prefixIcon:widget.icon!=null? Container(
                  width: 20.w,
                  height: 20.w,
                padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w),
                child: Center(child: widget.icon),
              ): null ,*/
               // su:icon!=null? BoxConstraints(minWidth: 30.w, minHeight: 25.w,):null
            ),
          ),
        ),
      ],
    );
  }
}
