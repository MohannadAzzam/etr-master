import 'package:easy_localization/easy_localization.dart';
import 'package:etr/dialogs/dialog_choose_country.dart';
import 'package:etr/items/item_social.dart';
import 'package:etr/module/settings.dart';
import 'package:etr/module/social.dart';
import 'package:etr/provider/home_provider.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/custom_widget/list_horizontal.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/scroll_column_expandable.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


import '../utils/custom_widget/my_text_faild.dart';




class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController country = TextEditingController();

  GlobalKey<FormState> key = GlobalKey() ;

  Country countryObg ;

  Settings settings = getSettings() ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar('Contact_us'.t),
      body: Form(
        key: key,
        child: ScrollColumnExpandable(
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            myText('contact_information'.t,color: fPrimaryColor,fontSize: 20.sp),
            SizedBox(height: 10.h),
            myText('message_contact_us'.t),
            SizedBox(height: 10.h),
            myText(settings.mobile,icon: 'phone_icon',color: fPrimaryColor),
            SizedBox(height: 10.h),
            myText(settings.mobile,icon: 'phone_icon',color: fPrimaryColor),
            SizedBox(height: 10.h),
            myText(settings.infoEmail,icon: 'email_icon',color: fPrimaryColor),
            SizedBox(height: 10.h),
            myText(settings.address,icon: 'location_icon',color: fPrimaryColor,iconSize: 20),
            SizedBox(height: 10.h),
            ListHorizontal(list: socialList,buildItem: (item)=> ItemSocial(social: item,color: fPrimaryColor),),

            myText('Contact_us'.t,color: fPrimaryColor,fontSize: 20.sp),
            MyTextFailed(
              marginTop: 10.h,
              controller:name ,
              hint: 'Name'.t,
              icon: svgImage('person_icon',color: fPrimaryColor),
            ),
            SizedBox(height: 10.h),
            MyTextFailed(
              withTitle: false,
              isMobile: true,
              controller: mobile ,
              hint: tr("Mobile"),
              icon: svgImage('phone_icon',color: fPrimaryColor),
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 10.h),
            MyTextFailed(
              withTitle: false,
              controller: email,
              hint: tr("Email"),
              icon: svgImage('email_icon',color: fPrimaryColor),
              textInputType: TextInputType.emailAddress,
            ),
            MyTextFailed(
              onTap: () async {
                Country c = await showCustomDialog(context, DialogChooseCountry(title:'country'.t ,));
                if(c!=null){
                  country.text = c.name;
                  countryObg = c ;
                }
              },
              marginTop: 10.h,

              controller: country,
              icon: svgImage('location_icon', color: fPrimaryColor),

              //textInputType: TextInputType.emailAddress,
              hint: 'country'.t,
            ),
            SizedBox(height: 10.h),
            MyTextFailed(
                maxLines: null,
                controller:title ,

                hint: tr("title")),
            Expanded(
              child: MyTextFailed(
                marginTop: 10.h,
                maxLines: null,

                textInputAction: TextInputAction.newline,
                controller:description ,
                minLines: 5,
                textInputType: TextInputType.multiline,
                  hint: tr("message")),
            ),
            SizedBox(height: 10.h),
            Center(
              child: DefaultButton(
                  onPressed: () async {
                    if(key.currentState.validate()){
                     bool status = await apiAction(apiContactUs,data:  {
                        "name": name.text,
                        "mobile": mobile.text,
                        "email": email.text,
                        "titel": title.text,
                        "country": countryObg.id,
                        "message": description.text,
                      },withShowSuccess: true,
                         withLoader: true);

                     if(status){
                       //context.read<HomeProvider>().currentScreen = 0 ;
                       //Provider.of<HomeProvider>(context,listen: false).currentScreen = 0 ;
                      Navigator.pop(context);
                     }
                    }
                    },
                  isExpanded: false,
                  text: 'Submit'.t),
            ),
            SizedBox(
              height: height / 100 * 5,
            ),
            // RichText(
            //   //textDirection: TextDirection.ltr,
            //   text: TextSpan(
            //     text: '',
            //     style: TextStyle(color: MyColors.textColorFailed,fontSize: 10.sp,fontFamily: 'Cairo'),
            //     children: <TextSpan>[
            //       TextSpan(text: ' ${tr('message_step1')} ', ),
            //       TextSpan(text: ' ${getSettings().mobile} ',style: TextStyle(color: Colors.blue),
            //           recognizer: new TapGestureRecognizer()..onTap = () {
            //             print('TapGestureRecognizer2') ;
            //             return launch('tel://${Mypref.getSettings().mobile}');
            //           }),
            //       TextSpan(text: ' ${tr('message_step_12')} ', ),
            //       TextSpan(text: ' ${Mypref.getSettings().whatsapp} ',style: TextStyle(color: Colors.blue),
            //           recognizer: new TapGestureRecognizer()..onTap = () {
            //         print('TapGestureRecognizer') ;
            //             var whatsappUrl =   'whatsapp://send?phone=${Mypref.getSettings().whatsapp}&text=Hellothere!' ;
            //            // var whatsappUrl ="whatsapp://send?phone=${Mypref.getSettings().whatsapp}";
            //             return launch(whatsappUrl);
            //           }),
            //       TextSpan(text: ' ${tr('message_step2')}',),
            //     ],
            //   ),
           // )
          ],
        ),
      ),
    );
  }

  // void valid() {
  //   if (name == null) {
  //     WebService.showDialogWithMessage(tr("enter_name"));
  //   } else if (mobile == null) {
  //     WebService.showDialogWithMessage(tr("enter_mobile"));
  //   } else if (email == null) {
  //     WebService.showDialogWithMessage(tr("enter_email"));
  //   } else if (description == null) {
  //     WebService.showDialogWithMessage(tr("enter_message"));
  //   } else {
  //     actionPost(WebService.create_contact_us, {
  //       "name": name.text,
  //       "mobile": mobile.text,
  //       "email": email.text,
  //       "description": description.text,
  //     }).then((value) {
  //       WebService.showDialogWithMessage(value['message']);
  //       setState(() {
  //         name.text = "" ;
  //         mobile.text = "" ;
  //         email.text = "" ;
  //         description.text = "" ;
  //       });
  //     });
  //   }
  // }
}
