
import 'package:etr/module/faqs.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ItemFAQ extends StatelessWidget {
  final int index  ;
  final Faqs faqs ;
  const ItemFAQ({Key key, this.index, this.faqs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: fWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: boxShadow()
      ),
      margin: EdgeInsets.all(15.r).copyWith(bottom: 0),
      //padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 25.h),
      child:ExpansionTile(
       // iconColor: widget.color,

       // initiallyExpanded: widget.list.isNotEmpty,
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor:Colors.transparent ,


        tilePadding: EdgeInsetsDirectional.only(end: 20.w),
        maintainState: false,

        title: itemTasks(faqs?.question ,index,),
        children: <Widget>[
          const Divider(height: 1,),
          Padding(
            padding: const EdgeInsets.all( 20),
            child: myText(faqs?.answer,),
          )
        ],
      ),
    );
  }
  Widget itemTasks(title,index){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w)/*.copyWith(top: 15.h)*/,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myText('Q${index + 1}',),
          SizedBox(width:  10.h,),
          Expanded(child: myText(title,)),

        ],
      ),
    );
  }
}
