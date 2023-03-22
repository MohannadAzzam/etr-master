import 'package:etr/items/item_exhibitors.dart';
import 'package:etr/items/item_header.dart';
import 'package:etr/items/item_organizers.dart';
import 'package:etr/items/item_shepherds.dart';
import 'package:etr/items/new_blog_item.dart';
import 'package:etr/module/exhibitors.dart';
import 'package:etr/module/faqs.dart';
import 'package:etr/screens/select_place_screen.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/custom_widget/my_list_paginat_grid.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExhibitorsScreen extends StatelessWidget {
  const ExhibitorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('exhibitors'.t),
      body: GetMyObject(
      url: apiExhibitors,
      fun: (json)=> Exhibitors.fromJson(json),
        onHasData: (value){
          Exhibitors item  =  value ;
        return ListView(
        //  physics: const BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          children: [

            ItemHeader(onTap: (){
              To(context, const SelectPlaceScreen());
            },title: 'BookingSpace'.t,details: item.details),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: item.exhibitions.length,
              //controller: homeController.controllerSnaps,
              //url: api_getMainCategoriesServices+'/${widget.id}',
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              // fun: (json) => MainCategoriesServices.fromJson(json),
              itemBuilder: (context,index)=>  ItemExhibitors(item:item.exhibitions[index] ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height * .70),
              ),
            ),
          ],
        );
        },

      ),
    );
  }
}
