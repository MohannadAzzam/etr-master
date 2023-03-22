import 'package:flutter/material.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/global_widget/anim/custom_fade_animation_component.dart';
import 'package:etr/utils/global_widget/component_status/error_respons_state.dart';
import 'package:etr/utils/my_colors.dart';


class MyViewObjApi extends StatefulWidget {
  AsyncSnapshot asyncSnapshot;
 final Widget Function() onHasData ;
 final  Function() onTryAgain ;
 final bool isSmallError ;
 final bool ifLoaderInternal ;

 final MyViewObjApiController controller ;

   MyViewObjApi({Key key, this.asyncSnapshot, this.onHasData, this.onTryAgain, this.controller, this.isSmallError = false, this.ifLoaderInternal=false}) : super(key: key);

  @override
  State<MyViewObjApi> createState() => _MyViewObjApiState();
}

class _MyViewObjApiState extends State<MyViewObjApi> {

  @override
  void initState() {

    super.initState();
    if(widget.controller!=null){
      widget.controller.onError = onError ;
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
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
     onRefresh: () => Future.sync(() {

         isError = false;

       return widget.onTryAgain();
     }),
        child:buildView()) ;

  }


  buildView(){
    if(isAppTestMode){
    return CustomFadeAnimationComponent(0, widget.onHasData(),) ;
  }

    if(widget.asyncSnapshot.connectionState == ConnectionState.waiting&&!isError){
      return widget.ifLoaderInternal?CircularProgressIndicator(color: fWhite,) : Container() ;
    }else if(widget.asyncSnapshot.hasData&&!isError){
      return CustomFadeAnimationComponent(0, widget.onHasData(),) ;
    }else{
      return ErrorResponseState(errorType:errorType ,onTryAgain:() {
          isError = false;
        widget.onTryAgain();
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
}
