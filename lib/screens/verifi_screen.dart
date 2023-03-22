

import 'package:custom_timer/custom_timer.dart';
import 'package:etr/module/user.dart';
import 'package:etr/utils/NavigationService.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/default_button.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/pinCodeCustom/pin_code_fields.dart';
import 'package:etr/utils/pinCodeCustom/pin_theme.dart';
import 'package:etr/utils/scroll_column_expandable.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/base_respons.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_notifier.dart';

class VerifiScreen extends StatefulWidget {
  final String email;

  VerifiScreen(this.email,);

  @override
  _VerifiScreenState createState() => _VerifiScreenState();
}

class _VerifiScreenState extends State<VerifiScreen> {

  reSendCode() async {
/*  bool status = await  apiAction(
       api_resendCode,

      dioType: DioType.post,
      withLoader: true,
      data: {
        'email':widget.email,
      },

    );
   if(status){
     _controller.reset() ;
     _controller.start() ;
     setState(() {
       isFinshed = false ;
     });
   }*/
  }
  fetchApi() async {

    if(code.length<4){
      showCustomFlash( text: 'agreeMessage'.t) ;
      return;
    }
  BaseResponse response = await  getObjData(
        apiVerifyCode,
        key: 'user',
        dioType: DioType.post,
        withLoader: true,
        data: {
          'email':widget.email,
          'code':code,
        },
        fun: (json) {
          return User.fromJson(json);
        },
        // onSuccess: (val){
        //
        //
        //
        //   // if((val as User).isDoctor){
        //   //   toRemoveAll(context, MainScreenDoctor());
        //   // }else{
        //   //   toRemoveAll(context, MainScreenUser());
        //   // }
        //
        //  // toRemoveAll(context, VerifiScreen());
        // }
    );
    if(response.status){
      User user = response.object  ;

      setUser(user);
      goHome(NavigationService.navigatorKey.currentContext,isFirst: true);
    }
  }


  CustomTimerController _controller = CustomTimerController();
  String code ;
 bool isFinshed  = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      _controller.start() ;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar('Mobile_Number_Verification'.t),
      body: ScrollColumnExpandable(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        children: [
          Spacer(flex: 10,) ,
          svgImage('logo',size: 150.r) ,

          Spacer(flex: 10,) ,
          Container(
            width: double.infinity,
            child: Card(elevation: 10,
              clipBehavior:Clip.hardEdge ,
              // margin: EdgeInsets.symmetric(horizontal: 20.w),
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)
              ) ,
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w , vertical: 30.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myText('Please_enter_activation_code'.t ,color: fPrimaryColor,fontSize: 20.sp,textAlign: TextAlign.center),
                    SizedBox(height: 10.h,) ,
                    PinCodeTextField(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      animationType: AnimationType.fade,

                      pinTheme: PinTheme(
                        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                        selectedColor: Colors.grey[100],
                        activeColor: Colors.grey[100],
                        activeFillColor: Colors.grey[100],
                        shape: PinCodeFieldShape.box,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 45.w,
                        fieldWidth: 45.w,

                        disabledColor:  Colors.grey[100],

                        inactiveFillColor: Colors.grey[100],
                        selectedFillColor:  Colors.grey[100],
                        inactiveColor:  Colors.grey[100],

                      ),
                      textStyle: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),

                      animationDuration: Duration(milliseconds: 300),
                      //  backgroundColor: Colors.blue.shade50,
                      enableActiveFill: false,

                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        code = value;
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      }, appContext: context,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTimer(
                            from: const Duration(seconds: 60),
                            to:   const Duration(seconds: 0),
                            controller: _controller,
                            onFinish: () {
                              setState(() {
                                isFinshed = true ;
                              });
                            },
                            builder: (time)  {

                              // if(time.minutes==0&&time.hours==0&& )
                              return myText(
                                  "${time.minutes}:${time.seconds}",
                                  color:fPrimaryColor,isBold: true
                              );
                            }
                        ),
                        //Spacer() ,
                        Visibility(
                          visible: isFinshed,
                            child: TextButton(

                              onPressed: (){
                                reSendCode() ;
                              },
                                child: myText('Resend_Code'.t, color: fPrimaryColor))) ,
                      ],
                    )
                  ],
                ),
              ) ,
            ),
          ),
          SizedBox(height: 20.h,) ,
          DefaultButton(text: 'Sign_up'.t,onPressed:(){
            fetchApi();
          }),

          Spacer(flex: 20,),
        ],
      ),
    );
  }
}
