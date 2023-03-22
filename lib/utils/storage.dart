import 'package:etr/module/settings.dart';
import 'package:etr/module/social.dart';
import 'package:etr/module/user.dart';
import 'package:etr/utils/components.dart';
import 'package:get_storage/get_storage.dart';




  setLang(String lang) {
    GetStorage().write("lang", lang);
  }

   setToken(String token) {
    GetStorage().write("token", token);
  }
  //
   String getToken() {
    return GetStorage().read("token");
  }
  //
   void setUserToken(String token) {
    GetStorage().write("user_token", token);
  }
  //
   String getUserToken() {
    return GetStorage().read("user_token");
  }
  //
   setSetting(Settings settings) {
      socialList =  [
       if(settings.facebook!=null)
         Social('feacbook_icon',settings.facebook ),
       if(settings.instagram!=null)
         Social('insta_icon',settings.instagram),
       if(settings.twitter!=null)
         Social('tweeter_icon',settings.twitter ),
       if(settings.linkedIn!=null)
         Social('in_icon',settings.linkedIn ),
     ] ;
    GetStorage().write("settings", settings.toJson());
  }
  //
   void setIsLogin(bool isLogin) {
    GetStorage().write("isLogin", isLogin);
  }

   bool isLogin() {
    return GetStorage().hasData("isLogin")
        ? GetStorage().read("isLogin")
        : false;
  }





void setIsNotification(bool isShow) {
  GetStorage().write("IsNotification", isShow);
}

bool isNotification() {
  return GetStorage().hasData("IsNotification")
      ? GetStorage().read("IsNotification")
      : true;
}


  //
   Settings getSettings() {
    return Settings.fromJson(GetStorage().read("settings"));
  }
  //
  // static void removeUser() {
  //   GetStorage().remove("user");
  // }
  //
   void setUser(User user) {
     setIsLogin(true);
     if(user.accessToken!=null){
       setUserToken(user.accessToken) ;

     }
    GetStorage().write("user", user.toJson());
    // GetStorage().writeInMemory("user", user);
  }
  //
   String getlang() {
    return GetStorage().hasData("lang")
        ? GetStorage().read("lang")
        :'';
  }

  removeUser(){
    setIsLogin(false);
    GetStorage().remove('user') ;

  }
   User getUser() {
     if(!isLogin()){
       return null;
     }
    return User.fromJson(GetStorage().read("user"));
    return GetStorage().read<User>("user");
  }

