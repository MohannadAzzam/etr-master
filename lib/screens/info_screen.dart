
import 'package:easy_localization/easy_localization.dart';
import 'package:etr/module/settings.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class InfooScreen extends StatefulWidget {
  int index;
  String title;

  InfooScreen(
      this.index,
      this.title,
      {Key key}) : super(key: key);

  @override
  _InfooScreenState createState() => _InfooScreenState();
}

class _InfooScreenState extends State<InfooScreen> {
  Future future;
  Settings settings;
  MyViewObjApiController controllerView = MyViewObjApiController();

  getData() {
    setState(() {
      //future = getObjData(api_pages + '/${widget.index}', key: 'page',fun: (json) => MyPage.fromJson(json),withLoader: true);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = getSettings();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
          widget.title
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          myImage('logo',fit: BoxFit.contain,height: 200.w,width: 200.w),
          Html(
            data: settings.pages[widget.index].description,
            customTextAlign: (_) => TextAlign.start,
            // customTextStyle: (node, baseStyle) {
            //   return baseStyle.merge(TextStyle(
            //     color: MyColors.textColor,
            //   ));
            // },
          )


        ],
      ),
    );
  }
}
