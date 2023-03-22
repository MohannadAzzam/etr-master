

import 'package:flutter/material.dart';

class AppNotifier with ChangeNotifier {

  Locale _locale ;

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  } // Locale get locale => Locale('ar', 'SA') ;


  AppNotifier(){
    print('AppNotifier AppNotifier') ;
  }
}