

import 'package:etr/app_notifier.dart';
import 'package:etr/items/item_social.dart';
import 'package:etr/main.dart';
import 'package:etr/module/drawer_menu.dart';
import 'package:etr/module/settings.dart';
import 'package:etr/provider/home_provider.dart';
import 'package:etr/screens/TravelHotelsScreen.dart';
import 'package:etr/screens/blog_screen.dart';
import 'package:etr/screens/contact_us.dart';
import 'package:etr/screens/exhibitors_screen.dart';
import 'package:etr/screens/faq_screen.dart';
import 'package:etr/screens/info_screen.dart';
import 'package:etr/screens/login_screen.dart';
import 'package:etr/screens/organizers_screen.dart';
import 'package:etr/screens/profile_screen.dart';
import 'package:etr/screens/profile_screen_exhibitor.dart';
import 'package:etr/screens/profile_screen_sponsor.dart';
import 'package:etr/screens/sponsors_screen.dart';
import 'package:etr/screens/tickets_screen.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/list_horizontal.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../module/social.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  List<DrawerMenu> menu =[];
  Settings settings ;
  @override
  void initState() {
    super.initState();
     settings = getSettings();

  }
  @override
  Widget build(BuildContext context) {

    printBlue('build');
    //HomeProvider home = Provider.of<HomeProvider>(context);
    menu.clear();
    menu.add(DrawerMenu(0, 'Home'.t, 'home_icon', (){
      Navigator.pop(context) ;
    }),) ;
    menu.add(DrawerMenu(1, 'exhibitors'.t, 'stor_icon', (){
      To(context, ExhibitorsScreen());
    })) ;
    menu.add(DrawerMenu(2, 'Sponsors'.t, 'medal_icon', (){
      To(context, const SponsorsScreen());
    })) ;
    menu.add(DrawerMenu(3, 'tickets'.t, 'ticket_icon', (){
      To(context, const TicketsScreen());
    }));
    menu.add(DrawerMenu(4, 'Travel_and_Hotels'.t, 'travel_icon', (){
      To(context, const TravelHotelsScreen());
    }));
    menu.add(DrawerMenu(4, 'Organizers'.t, 'persons_icon', (){
      To(context, const OrganizersScreen());
    }));
    menu.add(DrawerMenu(5, 'Blog'.t, 'blog_icon', (){
      To(context, const BlogScreen());})) ;
    menu.add(DrawerMenu(6, 'aboutUs'.t, 'info', (){
      To(context, InfooScreen(0, 'aboutUs'.t)) ;
    }));
    menu.add(DrawerMenu(7, 'FQA'.t, 'faq_icon', (){
      To(context, const FAQScreen()) ;
    }));
    menu.add(DrawerMenu(8, getlang()=='ar'?'English':'عربي', 'lang_icon', ()async{
      if(getlang()=='ar'){
        setLang('en');
        final _newLocale = Locale('en', 'UK');
        await context.setLocale(_newLocale);
       // Provider.of<AppNotifier>(context,listen: false).locale=_newLocale;
      }else{
        setLang('ar');
        final _newLocale = Locale('ar', 'SA');
        await context.setLocale(_newLocale);
        // context.setLocale(Locale('ar', 'SA'));
      //  Provider.of<AppNotifier>(context,listen: false).locale=_newLocale;
        // Provider.of<AppNotifier>(context,listen: false).notifyListeners();
      }
      RestartWidget.restartApp(context);
    })) ;
    menu.add(DrawerMenu(9, 'Contact_us'.t, 'email_icon', (){
      To(context, ContactUs()) ;
    }));
    menu.add(DrawerMenu(9, 'Logout'.t, 'logout_icon', () async {
      if (await showConfirmDialog(context,title: 'messageLogout'.t)) {
      apiAction(
        apiLogout,
      dioType: DioType.get,
      //withLoader: true,
      );
      removeUser();
      goHome(context);
      //toRemoveAll(context, LoginScreen()) ;
      }
    }));
   // print(getUser().image) ;
    return SafeArea(
      child: Drawer(
        backgroundColor: fPrimaryColor,
        child: ListView(
          children: [
            Container(
              color: fWhite,
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Center(
                    //padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myImage('logo', height: 70.w),
                        myText('Riyadh_International_Exhibition'.t,
                            color: fPrimaryColor,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700),
                        myText(
                          'for_childrens_games'.t,
                          color: fTextColor,
                          fontSize: 16.sp,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                if(isLogin()){
                  if(getUser().type==1){
                   await To(context, ProfileScreen());
                  }else if(getUser().type==2){
                   await To(context, ProfileScreenExhibitor());
                  }else{
                    await To(context, const ProfileScreenSponsor());
                  }
                  setState(() {});
                }else{
                 await To(context, LoginScreen());
                }


             // To(context, ProfileScreen());
              //To(context, ProfileScreenCompany());
              },
              child: Container(
                padding: EdgeInsets.all(20.r),
                color: fPrimaryColor62,
                  child:isLogin()? Row(children: [
                    Container(
                      padding: EdgeInsets.all(10.w) ,
                      decoration: BoxDecoration(
                        color: fWhite.withOpacity(0.5),
                        shape: BoxShape.circle
                      ),
                      child: Center(child: svgImage('person_icon',size: 20.w)),),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myText(getUser()?.name ,color: fWhite ,fontSize: 20.sp,fontWeight: FontWeight.w800),
                        myText('profile'.t,color: fTextLight,),
                      ],
                    )
                  ],) :Center(
                    child: myText('Sign_In'.t,color: fWhite,icon: 'person_icon'),
                  )
              ),
            ),


            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:(){
                    menu[index].onTab();
                    if(menu[index].id==8){

                    }
                  }  ,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      child: myText(menu[index].name,
                          icon: menu[index].icon,
                          fontSize: 18.sp,
                          color: fWhite)),
                );
              },
            ),
            SizedBox(height: 10.h),
            Center(child: ListHorizontal(list: socialList,buildItem: (item)=> ItemSocial(social: item),)),
            SizedBox(height: 20.h),

          ],
        ),
      ),
    );
  }
}


