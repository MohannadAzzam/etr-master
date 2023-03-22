import 'package:etr/items/item_exhibitors.dart';
import 'package:etr/items/item_package.dart';
import 'package:etr/items/item_place.dart';
import 'package:etr/module/sponsors.dart';
import 'package:etr/screens/image_view_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/custom_widget/my_list_paginat_grid.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePackageScreen extends StatefulWidget {
  const ChoosePackageScreen({Key key}) : super(key: key);

  @override
  State<ChoosePackageScreen> createState() => _ChoosePackageScreenState();
}

class _ChoosePackageScreenState extends State<ChoosePackageScreen> {
  int selectId = -1 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Choose_package'.t),
      body: ListView(
        padding: EdgeInsets.only(bottom: 60.h),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.w),
            child: Column(
              children: [
                myText('message_Choose_package'.t),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: (){
                    ToWithFade(context, const ImageViewScreen());
                  },
                  child: Hero(
                    tag: 'tag',
                      child: imageNet(getSettings().expoMap)),
                ),
              ],
            ),
          ),
          ListPaginationGrid(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            url: apiSponsorPackge,
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            fun: (json) => SponsorPackge.fromJson(json),
            buildItem: (item) => ItemPackage(item: item),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.w,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height * .60),
            ),
          )
        ],
      ),
    );
  }
}
