import 'package:etr/items/item_header.dart';
import 'package:etr/items/item_travel.dart';
import 'package:etr/module/travels.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/custom_widget/my_list_paginat_grid_sliver.dart';
import 'package:etr/utils/custom_widget/my_list_paginat_sliver.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelHotelsScreen extends StatelessWidget {
  const TravelHotelsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: myAppBar('Travel_and_Hotels'.t),
      body: GetMyObject(
      url: apiTravels,
      ifLoaderInternal: true,
      fun: (json)=> Travels.fromJson(json),
        onHasData: (value){
          Travels item = value ;
         return ListView(
           physics: const BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
            children: [
              ItemHeader(details:item.details ),
              GridView.builder(
                itemCount: item.travels.length,
                physics: const NeverScrollableScrollPhysics(),
                //controller: homeController.controllerSnaps,
                //url: api_getMainCategoriesServices+'/${widget.id}',
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                // fun: (json) => MainCategoriesServices.fromJson(json),
                itemBuilder: (context,index)=>  ItemTravel(item:item.travels[index] ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.w,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * .55),
                ),
              ),
            ],
          );
        }
      ));
  }
}
