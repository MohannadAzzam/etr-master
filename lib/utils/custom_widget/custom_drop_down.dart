import 'package:flutter/material.dart';
import 'package:etr/utils/controllers/controler_button.dart';
import 'package:etr/utils/components.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:etr/utils/my_colors.dart';


class CustomDropDown extends StatefulWidget {
  final List<dynamic> list ;
  final String Function(dynamic) buildName ;
  final Function onSelect;
  final dynamic selectedLaunch;
  final DropDawnListController dawnListController ;
  final String title ;
  final String hint ;
  final bool isUnderLine ;
  final bool isRequired;
  final double marginTop ;

  CustomDropDown( this.list,{Key key, this.buildName, this.onSelect, this.title, this.selectedLaunch, this.hint = '', this.isUnderLine = false, this.dawnListController, this.isRequired= true, this.marginTop ,}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}


class _CustomDropDownState extends State<CustomDropDown> {
  dynamic dropdownValue ;
  List<dynamic> list =[];
  @override
  void initState() {
    list = widget.list ;
     try {
       dropdownValue =list.firstWhere((element) => element.id == widget.dawnListController.selectedObj.id,orElse: () => null,) ;
     }catch (e,s) {
       print(s) ;
     }
    print('dropdownValue $dropdownValue' );
    if(widget.dawnListController!=null){
      widget.dawnListController.updateList = updateList ;
      widget.dawnListController.clean = clear ;
    }
    //dropdownValue = widget.list[0];
    super.initState();
  }
   updateList(List<dynamic> listt) {
    if(mounted)
     setState(() {
       list =listt ;
     });
   }
   clear(){
     setState(() {     list = [] ;
     dropdownValue = null ;});
   }
  @override
  void dispose() {
    super.dispose();
    dropdownValue = null;
  }

  @override
  Widget build(BuildContext context) {
    print(dropdownValue.toString()) ;
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

          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal:widget.isUnderLine? 0:10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: widget.isUnderLine?null:fBackGroundTextFailed
          ),
          width: double.infinity,
          child: DropdownButtonFormField<dynamic>(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: widget.isUnderLine?Colors.black45: Colors.white))),
            validator: (val){
              if(val ==null){
                return 'fieldRequired'.t ;
              }
              return null ;
            },

            hint: myText(widget.hint),
           // value: dropdownValue,
            value: dropdownValue != null ? dropdownValue : null,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),

            // underline: Container(
            //   height: 2,
            //   color: Colors.transparent,
            // ),
            onChanged: (dynamic newValue) {
              FocusScope.of(context).requestFocus(FocusNode());
              setState(() {
                widget.dawnListController?.selectedObj = newValue ;
                dropdownValue = newValue;
                if(widget.onSelect!=null)
                widget.onSelect(newValue) ;
              });
            },

            items: list.map<DropdownMenuItem<dynamic>>((dynamic value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(value is String ?value:'${(widget.buildName!=null?widget.buildName(value):null)??'non'}',style: Theme.of(context).textTheme.headline5,),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}