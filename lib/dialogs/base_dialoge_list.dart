
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseDialogList extends StatelessWidget {
 final Widget child;
 final String title ;
 final String buttonText ;
 const BaseDialogList({Key key, this.child, this.title, this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size =  MediaQuery.of(context).size ;
    return Container(
      width:  MediaQuery.of(context).size.width-50,
      constraints: BoxConstraints(
        maxHeight:size.height*0.75,
        minHeight: size.height*0.2,
      ),
      padding: EdgeInsets.all(8).copyWith(top: 20.h),
      child: Column(
       // mainAxisSize: MainAxisSize.min,
        children: [

          Center(child: myText(title,isBold: true,fontSize: 18.sp)),

        //  const SizedBox(height: 20,),
          Expanded(child: child),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 20.w),
            width: double.infinity,
              child: OutlinedButton(onPressed: (){
                Navigator.pop(context) ;
              }, child: myText('Cancel'.t,color: fSecondaryColor),style: elevatedOutLinButtonStyle(color: fSecondaryColor))),
          // DefaultButton(onPressed: (){
          //   Navigator.pop(context) ;
          // }, text: 'text',)
        ],
      ),
    );
  }
}
