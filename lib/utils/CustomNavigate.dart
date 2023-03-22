import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigate<T extends ChangeNotifier> {

 Future navigateTo(context, widget ,{Create<T> create,}) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>create!=null? ChangeNotifierProvider<T>(
          create: (context) => create(context),
          child: widget,
        ):widget),
  ) ;


 Future navigateAndFinish(context, widget ,{@required Create<T> create,}) =>
     Navigator.pushAndRemoveUntil(
         context,
         MaterialPageRoute(
             builder: (context) => create != null
                 ? ChangeNotifierProvider<T>(
               create: (context) => create(context),
               child: widget,
             )
                 : widget),
             (Route<dynamic> route) => false);
}