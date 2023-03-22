import 'dart:io';

import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/bottom_sheet_image.dart';
import 'package:etr/utils/custom_widget/item_image_selected.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ImageSelect extends StatefulWidget {
   final String image ;
   final Function(File) onChange ;
   final double top ;
   final String hint ;
   final File file;
   BuildContext context ;
   ImageSelect(this.context , {Key key,this.image = '', this.onChange, this.top = 10, this.file, this.hint}) : super(key: key);

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {


  Widget get getView {
    if(widget.file!=null){
      return ItemImageSelected(file: widget.file ,onDelete:(){
        widget.onChange(null) ;
      },);
    }else if (widget.image.isNotEmpty){
      return Container(
        decoration: boxDecoration,
          width: 100.w,
          height: 100.w,
          child: imageNet(widget.image)) ;
    }else{
      return Container(
        clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: fBackGroundTextFailed,
            borderRadius: BorderRadius.circular(10)
          ),
         // width: 100.w,
          height: 100.w,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.image,size: 40.r,color: fTextColor),
                myText(widget.hint,)
              ],
            ),
          )) ;
    }

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        File file = await getImage(widget.context);
        widget.onChange(file) ;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(top: widget.top),
          child: getView),
    ) ;
  }
}
