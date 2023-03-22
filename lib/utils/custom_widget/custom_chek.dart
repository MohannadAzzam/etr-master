import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:etr/utils/my_colors.dart';

class CustomCheck extends StatefulWidget {
  final Function onChange ;
   bool isCheck ;
  final Color color  ;
   CustomCheck(this.isCheck, this.onChange , {this.color=fWhite  ,Key key,}) : super(key: key);

  @override
  CustomCheckState createState() => CustomCheckState();
}

class CustomCheckState extends State<CustomCheck> {

  setCheck(){

    widget.isCheck = !widget.isCheck ;
    setState(() {

    });
    return  widget.isCheck ;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChange,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isCheck?fPrimaryColor :widget.color ,
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: fPrimaryColor,
            )),
        child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Visibility(
              visible: widget.isCheck,
              child:Icon(
                Icons.check,
                size: 12.0,
                color: widget.color,
              ) /*Icon(
                Icons.circle,
                size: 12.0,
                color: widget.color,
              )*/,
              replacement: Icon(
                Icons.check,
                size: 12.0,
                color: Colors.transparent,
              ),
            )),
      ),
    );
  }
}
