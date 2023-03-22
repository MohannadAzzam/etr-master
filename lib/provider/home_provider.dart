
import 'package:etr/app_notifier.dart';
import 'package:etr/screens/TravelHotelsScreen.dart';
import 'package:etr/screens/contact_us.dart';
import 'package:etr/screens/exhibitors_screen.dart';
import 'package:etr/screens/faq_screen.dart';
import 'package:etr/screens/info_screen.dart';
import 'package:etr/screens/organizers_screen.dart';
import 'package:etr/screens/sponsors_screen.dart';
import 'package:etr/screens/tickets_screen.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/module/drawer_menu.dart';
import 'package:etr/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../screens/blog_screen.dart';

class HomeProvider extends ChangeNotifier{

  int _currentScreen = 0 ;
  Key key=  const ValueKey(0) ;


  int get currentScreen => _currentScreen;

  set currentScreen(int value) {
    _currentScreen = value;
    notifyListeners();
  }


  BuildContext context ;
  HomeProvider(this.context){

  }

  Widget get page {
     key = ValueKey(currentScreen);
    switch(currentScreen){
      case 0:
       // return const PageHome(key: ValueKey(0),) ;
      case 1:
       // return const MyCartPage(key:  ValueKey(1)) ;
      case 2:
       // return  const ChatPage(key: ValueKey(2)) ;
      case 3:
       // return  const OrderPage(key: ValueKey(3)) ;
      case 4:
       // return  const ContactUs(key: ValueKey(4),) ;
      case 5:
      //  return  InfooScreen(0,'',key: const ValueKey(5)) ;
      case 6:
      // return  const SettingsPage(key: ValueKey(6)) ;
      default :
       // return const PageHome(key: ValueKey(0)) ;

    }
  }
 // String get title => menu[currentScreen].name ;




}