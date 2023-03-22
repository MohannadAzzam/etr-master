import 'package:etr/dialogs/dialog_edit_prifile.dart';
import 'package:etr/items/item_ticket.dart';
import 'package:etr/items/logo_item.dart';
import 'package:etr/module/user.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/global_widget/component_status/no_result_item.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   int index = 0 ;

  TabBar get _tabBar => TabBar(
    tabs: [
      Tab(child: myText('tickets'.t,color: index==0?fPrimaryColor:fTextLight,icon: 'ticket_icon'), /*text: 'tickets'.t,icon: svgImage('ticket_icon',color: fPrimaryColor)*/),
      Tab(child: myText('profile'.t,color: index==1?fPrimaryColor:fTextLight,icon: 'person_icon'), /*text: 'tickets'.t,icon: svgImage('ticket_icon',color: fPrimaryColor)*/),
    ],
  );

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: _tabBar.tabs.length, // This is the number of tabs.
      child: Scaffold(
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
                  expandedHeight: 300.0,
                  excludeHeaderSemantics: true,
                  actions: [IconButton(onPressed: () async {
                   await bottomSheet(context: context, child: DialogEditProfile());
                   setState(() {

                   });
                  }, icon: Icon(Icons.more_vert,))],
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background:   Container(
                      padding: EdgeInsets.only(bottom: 40.h),
                      color: fPrimaryColor,
                      child:  Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(30.r),
                              margin: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: fWhite,width: 1),
                                  shape: BoxShape.circle
                              ),
                              child:svgImage('person_icon',size: 30.r,color: fWhite) ,
                            ),
                            myText('profile'.t,color: fWhite),
                          ],
                        ),
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: _tabBar.preferredSize,
                    child: ColoredBox(
                      color: fWhite,
                      child: TabBar(
                        onTap: (value) {
                          setState(() {
                            index = value ;
                          });
                        },
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        indicatorPadding: EdgeInsets.all(0),
                        indicatorWeight: 2,
                        labelPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.w),
                        labelColor: fPrimaryColor,
                        unselectedLabelColor: fTextLight,
                        tabs: _tabBar.tabs,
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: [TabTickets(),TabProfile()],
          ),
        ),
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
                      myText(user.country_name.toString(),icon: 'location_icon',color: fPrimaryColor),
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

class TabTickets extends StatefulWidget {
  const TabTickets({Key key}) : super(key: key);

  @override
  State<TabTickets> createState() => _TabTicketsState();
}

class _TabTicketsState extends State<TabTickets> {

  MyViewObjApiController controller =MyViewObjApiController() ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: const PageStorageKey<String>('TabTickets'),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 200.h
                        ),
                        child: GetMyObject(
                          controller: controller,
                            url: apiMyProfile,
                            keyO: 'user',
                            fun: (json) => User.fromJson(json),
                            onHasData: (value) {
                              User user = value ;
                            return user.tickets.isNotEmpty? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:List.generate(user.tickets.length, (index) => ItemTicket(ticket:user.tickets[index] ,))
                            ):NoDataState(onTryAgain: (){
                              controller.update();
                            });
                          }
                        ),
                      ),
                      DefaultButton(onPressed: (){}, text: 'Ticket_booking'.t,isExpanded: false,icon: 'ticket_icon',)
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

