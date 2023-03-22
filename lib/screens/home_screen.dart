import 'dart:async';

import 'package:etr/items/item_category.dart';
import 'package:etr/items/item_offer.dart';
import 'package:etr/items/item_social.dart';
import 'package:etr/items/item_suport.dart';
import 'package:etr/items/new_blog_item.dart';
import 'package:etr/main.dart';
import 'package:etr/module/drawer_menu.dart';
import 'package:etr/module/home_model.dart';
import 'package:etr/provider/home_provider.dart';
import 'package:etr/screens/TravelHotelsScreen.dart';
import 'package:etr/screens/blog_screen.dart';
import 'package:etr/screens/contact_us.dart';
import 'package:etr/screens/drawer_screen.dart';
import 'package:etr/screens/exhibitors_screen.dart';
import 'package:etr/screens/faq_screen.dart';
import 'package:etr/screens/info_screen.dart';
import 'package:etr/screens/login_screen.dart';
import 'package:etr/screens/notification_screen.dart';
import 'package:etr/screens/organizers_screen.dart';
import 'package:etr/screens/profile_screen.dart';
import 'package:etr/screens/profile_screen_exhibitor.dart';
import 'package:etr/screens/profile_screen_sponsor.dart';
import 'package:etr/screens/sponsors_screen.dart';
import 'package:etr/screens/tickets_screen.dart';
import 'package:etr/utils/Constant.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/custom_widget/list_horizontal.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      extendBodyBehindAppBar: true,
      //  extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: fPrimaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Scaffold(
        drawer: DrawerScreen(),
        body: ListView(
          children: [
            SizedBox(
              //  margin: EdgeInsets.only(top: 10 ),
              height: 310.h,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 70.h),
                    child: svgImage('header_home', fit: BoxFit.fill),
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myAppBar('', widget: Builder(builder: (context) {
                        return IconButton(
                            icon: svgImage(getlang() == 'en'
                                ? 'menu_icon_en'
                                : 'menu_icon'),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            });
                      }), backgroundColor: Colors.transparent, actions: [
                        IconButton(
                          onPressed: () {
                            To(context, const NotificationsScreen());
                          },
                          icon: svgImage('notificaton_icon'),
                          padding: EdgeInsets.all(10.w),
                        )
                      ]),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myImage('logo', height: 70.w),
                            myText('Riyadh_International_Exhibition'.t,
                                color: fWhite,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700),
                            myText(
                              'for_childrens_games'.t,
                              color: fWhite,
                              fontSize: 16.sp,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h, bottom: 5.h),
                        height: 120.h,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ItemCategory(
                                    drawerMenu: DrawerMenu(
                                        0, 'Travel_and_Hotels'.t, 'travel_icon',
                                        () {
                                  To(context, const TravelHotelsScreen());
                                })),
                                ItemCategory(
                                    drawerMenu: DrawerMenu(
                                        1, 'exhibitors'.t, 'stor_icon', () {
                                  To(context, const ExhibitorsScreen());
                                })),
                                ItemCategory(
                                    drawerMenu: DrawerMenu(
                                        2, 'Events'.t, 'ticket_icon', () {
                                  To(context, const TicketsScreen());
                                })),
                                ItemCategory(
                                    drawerMenu: DrawerMenu(
                                        3, 'Sponsors'.t, 'medal_icon', () {
                                  To(context, const SponsorsScreen());
                                })),
                                ItemCategory(
                                    drawerMenu: DrawerMenu(
                                        4, 'Etr_Digital'.t, 'info', () {
                                  To(context, InfooScreen(3, 'Etr_Digital'.t));
                                })),
                                ItemCategory(
                                    drawerMenu: DrawerMenu(
                                        5, 'Symposium'.t, 'info', () {
                                  To(context, InfooScreen(4, 'Symposium'.t));
                                })),
                              ],
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GetMyObject(
              url: apiHome,
              fun: (json) => HomeModel.fromJson(json),
              onHasData: (value) {
                HomeModel home = value;

                print(home.toJson().toString());
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListHorizontal(
                        list: home.categores,
                        buildItem: (item) => ItemOffer(categore: item)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText('Help'.t,
                              color: fPrimaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                          SizedBox(height: 5.h),
                          myText('messageHelp'.t),
                        ],
                      ),
                    ),
                    ListHorizontal(
                        list: home.supportTeams,
                        buildItem: (item) => ItemSupport(
                              supportTeam: item,
                            )),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myText('new_blog'.t,
                          color: fPrimaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    ListHorizontal(
                        list: home.blogs,
                        buildItem: (item) => NewBlogItem(
                              item: item,
                            )),
                    SizedBox(height: 40.h),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
