import 'dart:async';

import 'package:etr/app_notifier.dart';
import 'package:etr/module/settings.dart';
import 'package:etr/screens/TravelHotelsScreen.dart';
import 'package:etr/screens/blog_details_screen.dart';
import 'package:etr/screens/blog_screen.dart';
import 'package:etr/screens/change_password.dart';
import 'package:etr/screens/choose_package_screen.dart';
import 'package:etr/screens/contact_us.dart';
import 'package:etr/screens/edit_profile_screen.dart';
import 'package:etr/screens/exhibitors_screen.dart';
import 'package:etr/screens/faq_screen.dart';
import 'package:etr/screens/home_screen.dart';
import 'package:etr/screens/image_view_screen.dart';
import 'package:etr/screens/info_screen.dart';
import 'package:etr/screens/login_screen.dart';
import 'package:etr/screens/organizers_screen.dart';
import 'package:etr/screens/profile_screen.dart';
import 'package:etr/screens/profile_screen_exhibitor.dart';
import 'package:etr/screens/profile_screen_sponsor.dart';
import 'package:etr/screens/select_lang_screen.dart';
import 'package:etr/screens/select_place_screen.dart';
import 'package:etr/screens/select_type_account_screen.dart';
import 'package:etr/screens/sign_up_screen.dart';
import 'package:etr/screens/sponsors_screen.dart';
import 'package:etr/screens/tickets_screen.dart';
import 'package:etr/screens/verifi_screen.dart';
import 'package:etr/utils/NavigationService.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/my_view_obj_api.dart';
import 'package:etr/utils/fcm/fcm_config.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/styles.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await GetStorage.init();



 // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

   initApp();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNotifier()),
      ],
      child: EasyLocalization(
        path: 'assets/locales',
        //fallbackLocale: Locale('en','UK'),
        useFallbackTranslations: true,
        startLocale: Locale('ar', 'SA'),
        supportedLocales: [Locale('ar', 'SA'), Locale('en', 'UK')],
     //  child: DevicePreview(child: MyApp()),
        child: RestartWidget(child: MyApp()),
      ),
    ),
  );
}
class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}
class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}



class MyApp extends StatelessWidget {
   MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.

  final botToastBuilder = BotToastInit();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.dark, //navigation bar icons' color
    ));
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,

      useInheritedMediaQuery: true,
      // rebuildFactor: (MediaQueryData old, MediaQueryData data){
      //   return false ;
      // },
      builder: (context, child) {
        return Consumer<AppNotifier>(
            builder: (context, cart, child) {
            return MaterialApp(
             // title: 'Flutter Demo',
             // key: ValueKey('${context.locale}'),
              navigatorKey: NavigationService.navigatorKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              // builder: (context, child) {
              //   return MediaQuery(
              //     child: child,
              //     data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              //   );
              // },
              builder:(context, child) {

                  child = botToastBuilder(context,child);
                  return MediaQuery(
                      child: child,data: MediaQuery.of(context).copyWith(textScaleFactor: 0.7),
                    );
                },
                  navigatorObservers: [BotToastNavigatorObserver()],

                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      elevation: 0,
                      titleTextStyle: TextStyle(
                          color: fWhite,
                          fontSize: 20.sp,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600),
                      toolbarTextStyle: TextStyle(
                          color: fSecondaryColor,
                          fontSize: 24.sp,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600),
                      iconTheme: IconThemeData(color: fWhite),
                      color: fSecondaryColor,
                      systemOverlayStyle: SystemUiOverlayStyle.dark,
                    ),

                    tabBarTheme: TabBarTheme(
                        labelStyle: TextStyle(fontFamily: 'Cairo',fontSize: 16.sp,fontWeight: FontWeight.w500),
                        unselectedLabelStyle: TextStyle(fontFamily: 'Cairo',fontSize: 16.sp,fontWeight: FontWeight.w500)
                    ),
                    backgroundColor: fWhite,

                    textTheme:  TextTheme(
                        headline4: TextStyle(
                            color: fTextColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800),
                        headline5: TextStyle(
                            color: fTextColorFailed,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        headline6: TextStyle(
                            color:fTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                        button: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800)),
                    elevatedButtonTheme:
                    ElevatedButtonThemeData(style: elevatedButtonStyle()),
                    scaffoldBackgroundColor: Colors.white,
                    primaryColorLight: fSecondaryColor,
                    fontFamily: 'Cairo',
                    primaryColorDark: fSecondaryColor,
                    primarySwatch: greenM,
                    primaryColor: fSecondaryColor,

                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: SplashScreen(),
            );
          }
        );
      },
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyViewObjApiController controller =MyViewObjApiController() ;
  AsyncSnapshot asyncSnapshot ;
  fetchApi() async {
    return await getObjData(
      apiGetSetting,
      fun: (json) {
        return Settings.fromJson(json);
      },
      onError: (error){
        controller.onError(error);
      },
      onSuccess: (val){
        setSetting(val);
        Timer(const Duration(
          milliseconds: 3000,
        ), () {
         // setLang('');
         // if(isLogin()){
          if(getlang()==''){
            ToRemove(NavigationService.navigatorKey.currentContext ,const SelectLangAccount()) ;
          }else{
            ToRemove(NavigationService.navigatorKey.currentContext ,const HomeScreen()) ;

          }
          // }else{
          //   ToRemove(NavigationService.navigatorKey.currentContext ,const LoginScreen()) ;
          //
          // }
       });
        // startFCMlisten();
      },
    );
  }
  @override
  void initState() {
    super.initState();
    fetchApi() ;
  }

  @override
  Widget build(BuildContext context) {
    asyncSnapshot =  const AsyncSnapshot.withData( ConnectionState.done, '');

    return Scaffold(
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark,backgroundColor: Colors.transparent,toolbarHeight: 0,),
      backgroundColor: fWhite,
      body: MyViewObjApi(
          asyncSnapshot: asyncSnapshot,
          onTryAgain: () => fetchApi(),
          controller: controller,
          onHasData: () {
            return Stack(

              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          constraints: BoxConstraints.tight(Size.square(200.r)),
                          child:myImage('logo',fit: BoxFit.contain) /*svgImage('logo_svg')*/),
                      myText('Riyadh_International_Exhibition'.t,
                          color: fPrimaryColor,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700),
                      myText(
                        'for_childrens_games'.t,
                        //color: fWhite,
                        fontSize: 16.sp,
                      )
                    ],
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

}

