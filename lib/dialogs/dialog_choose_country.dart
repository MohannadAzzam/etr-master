
import 'package:etr/dialogs/base_dialoge_list.dart';
import 'package:etr/module/settings.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DialogChooseCountry extends StatefulWidget {
 final String title ;
  const DialogChooseCountry({Key key, this.title,}) : super(key: key);

  @override
  _DialogChooseCountryState createState() => _DialogChooseCountryState();
}

class _DialogChooseCountryState extends State<DialogChooseCountry> {
  Settings settings ;
  @override
  void initState() {
    // TODO: implement initState
    settings = getSettings() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseDialogList(
      title: widget.title,
      child: ListView.builder(
        // physics:const NeverScrollableScrollPhysics() ,
        //  shrinkWrap: true,
         itemCount: settings.countries.length,
          //  fun: (json) => City.fromJson(json),
          itemBuilder: (BuildContext context, int index) =>  myItem(settings.countries[index],(){
            Navigator.pop(context,settings.countries[index]) ;
          })
      ),
    );
  }
  myItem(Country country,onTap){
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Row(
          children: [
            myText(country.name,fontSize: 16.sp,),
            const Spacer(),
           const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    ) ;
  }
//ItemCategory(onTap: (),)
}
