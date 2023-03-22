import 'package:etr/dialogs/dialog_edit_prifile.dart';
import 'package:etr/items/item_ticket.dart';
import 'package:etr/items/logo_item.dart';
import 'package:etr/module/user.dart';
import 'package:etr/screens/choose_package_screen.dart';
import 'package:etr/screens/select_place_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileScreenExhibitor extends StatefulWidget {
   ProfileScreenExhibitor({Key key}) : super(key: key);

  @override
  State<ProfileScreenExhibitor> createState() => _ProfileScreenExhibitorState();
}

class _ProfileScreenExhibitorState extends State<ProfileScreenExhibitor> {





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle:
              NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,

              //  title: const Text('الملف الشخصي'), // This is the title in the app bar.

                pinned: true,
                backgroundColor: fPrimaryColor,
                expandedHeight: 270.0,
                excludeHeaderSemantics: true,
                actions: [IconButton(onPressed: () async {
                 await bottomSheet(context: context, child: DialogEditProfile());
                 setState(() {});
                }, icon: Icon(Icons.more_vert,))],
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background:   Container(
                  //  padding: EdgeInsets.only(bottom: 40.h),
                    color: fPrimaryColor,
                    child:  Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          imageCircle(getUser().image,radius: 50.r),
                          SizedBox(height: 10.h),
                          myText(getUser().companyName,color: fWhite),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
            ),
          ];
        },
        body:TabProfile(),

      ),
    );
  }
}


class TabProfile extends StatelessWidget {
  const TabProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = getUser() ;
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: const PageStorageKey<String>('TabProfile'),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding:  EdgeInsets.all(20.w),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      myText(user.name,icon: 'person_icon',color: fPrimaryColor),
                      SizedBox(height: 5.h),
                      myText(user.mobile,icon: 'phone_icon',color: fPrimaryColor),
                      SizedBox(height: 5.h),
                      myText(user.email,icon: 'email_icon',color: fPrimaryColor),
                      SizedBox(height: 5.h),
                      myText(user.country_name,icon: 'location_icon',color: fPrimaryColor),
                      Divider(),
                      SizedBox(height: 20.h),
                      myText('workspace_data'.t,icon: 'stor_icon',color: fPrimaryColor,fontSize: 20.sp,fontWeight: FontWeight.w800),

                      GetMyObject(
                        url: apiMyProfile,
                        keyO: 'user',
                        fun: (json) => User.fromJson(json),
                        onHasData: (value) {
                          return Column(
                            children: [
                              myText('message_exhibitors'.t) ,

                              SizedBox(height: 10.h),
                              Center(child: DefaultButton(onPressed: (){

                                //To(context, SelectPlaceScreen());
                                To(context, const SelectPlaceScreen());
                              }, text: 'BookingSpace'.t,icon: 'stor_icon',isExpanded: false,))
                            ],
                          );
                        },
                      )


                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


