import 'package:etr/utils/web_service/base_respons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/global_widget/anim/custom_fade_animation_component.dart';
import 'package:etr/utils/global_widget/component_status/error_respons_state.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/web_service/dio_helper.dart';



class GetMyObject/*<T>*/ extends StatefulWidget {

 final Widget Function(/*T*/ dynamic value) onHasData ;
 final Function(/*T */dynamic value) onFirstTime ;
 final Function() onTryAgain ;
 final bool isSmallError ;
 final bool ifLoaderInternal ;
 final String url;
 final String keyO;
 final MyViewObjApiController controller ;
 final dynamic Function(Map<String, dynamic> json) fun;
   GetMyObject({Key key, this.onHasData,   this.keyO= 'items', this.onTryAgain, this.controller, this.isSmallError = false, this.ifLoaderInternal=true, this.url, this.fun, this.onFirstTime}) : super(key: key);

  @override
  State<GetMyObject> createState() => _GetMyObjectState();
}

class _GetMyObjectState extends State<GetMyObject> {
  Future future ;

  bool isFirst = true ;
  getData(){
    setState(() {
      future = getObjData(widget.url,
          key: widget.keyO,
          fun:widget.fun,
          withLoader: !widget.ifLoaderInternal,
      onSuccess: (val){
        if(widget.onFirstTime!=null){
          widget.onFirstTime(val);
          isFirst = false;
        }
      },
      onError: (error) => onError(error),);
    });

  }

  @override
  void initState() {
    super.initState();
    getData();
    if(widget.controller!=null){
      print('controller controller');
      widget.controller.onError = onError ;
      widget.controller.update = update ;
    }
  }
  ErrorType errorType =  ErrorType.NON ;
  bool isError = false;
  onError(error){
    setState(() {
      isError = true ;
      errorType = error ;
    });
  }
  update(){
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: fWhite,
      child: RefreshIndicator(
        color: Colors.blue,
       triggerMode: RefreshIndicatorTriggerMode.onEdge,

       onRefresh: () => Future.sync(() {
           isError = false;
         return getData();
       }), child: FutureBuilder(
            future: future/*.then((value) => widget.onFirstTime((value as BaseResponse).object))*/,
            builder: (context, snapshot) {
                return buildView(snapshot) ;
              },
          )),
    );

  }


  buildView(AsyncSnapshot asyncSnapshot){
    if(isAppTestMode){
       dynamic value ;
      return CustomFadeAnimationComponent(0, widget.onHasData(null),) ;
    }
    if(asyncSnapshot.connectionState == ConnectionState.waiting&&!isError){
      return widget.ifLoaderInternal?Center(child: SpinKitThreeBounce(
        color: fPrimaryColor,
        size: 30.0,
      ),) : Container() ;
    }else if(asyncSnapshot.hasData && !isError){
      return CustomFadeAnimationComponent(0, widget.onHasData((asyncSnapshot.data as BaseResponse).object),) ;
    }else{
      return ErrorResponseState(errorType:errorType ,onTryAgain:() {
        isError = false;
        getData() ;
       // widget.onTryAgain();
        },isSmallError: widget.isSmallError,);
      // switch(errorType){
      //   case ErrorType.CRASH_ERROR:
      //     return Center(child: InkWell(
      //         onTap: (){
      //           if(widget.onTryAgain!=null){
      //             widget.onTryAgain() ;
      //           }
      //         },
      //         child: myText('CRASH_ERROR',fontSize: 50)),);
      //   case ErrorType.NO_INTERNET:
      //     return NoInternetState(onTryAgain:widget.onTryAgain,) ;
      //   case ErrorType.NOT_SUCCESS:
      //     return Container(child: myText('NOT_SUCCESS',fontSize: 50)) ;
      //   case ErrorType.NON:
      //     return Container(child: myText('NON',fontSize: 50)) ;
      // }
    }
  }
}

class MyViewObjApiController {

 void Function(ErrorType) onError ;
  Function update ;
}
