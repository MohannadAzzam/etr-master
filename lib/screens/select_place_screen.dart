import 'package:etr/items/item_place.dart';
import 'package:etr/module/exhibitors.dart';
import 'package:etr/screens/image_view_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPlaceScreen extends StatefulWidget {
  const SelectPlaceScreen({Key key}) : super(key: key);

  @override
  State<SelectPlaceScreen> createState() => _SelectPlaceScreenState();
}

class _SelectPlaceScreenState extends State<SelectPlaceScreen> {
  int selectId = -1 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Choose_location_exhibition'.t),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20.w).copyWith(bottom: 60.h),
            children: [
              myText('message_Choose_package'.t),
              SizedBox(height: 10.h),
              InkWell(
                onTap: (){
                  ToWithFade(context, ImageViewScreen());
                },
                child: Hero(
                  tag: 'tag',
                    child: imageNet(getSettings().expoMap)),
              ),
              ListPagination(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                fun: (json)=> Space.fromJson(json),
                url: apiSpaces,
                buildItem: (item)=>  ItemPlace(space: item,isSelect: item.id==selectId ,onSelect: (){
                  setState(() {
                    selectId = item.id ;
                  });
                }),

              )
            ],
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              color: fWhite,
              child: Center(child: DefaultButton(onPressed:selectId==-1?null: (){}, text: 'Booking'.t,isExpanded: false,)),
            ),
          )
        ],
      ),
    );
  }
}
