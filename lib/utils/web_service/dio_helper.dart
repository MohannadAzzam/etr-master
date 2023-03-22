import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/storage.dart';
import 'package:etr/utils/web_service/base_respons.dart';
import 'package:etr/utils/web_service/my_http_overrides.dart';
import 'package:etr/utils/web_service/web_service.dart';






Dio dio;

dioHelperIni() {
  HttpOverrides.global = MyHttpOverrides() ;
  dio = Dio(
    BaseOptions(
      baseUrl: domain2,
      headers: {
        'Accept': 'application/json',
      },
    ),

  );

}


Future<Response> getResponse(
    String path, bool withLoader,
    {Map<String, dynamic> data,

      DioType dioType = DioType.post}) async {
  if (withLoader) BotToast.showLoading();

  printGreen('url $path') ;
  String token = getUserToken();
  //dio.options.sendTimeout = 5000 ;
  dio.options.connectTimeout = 200000 ;
  dio.options.headers = {
    'Authorization': 'Bearer $token',
    "fcmToken": getToken(),
    'Accept': 'application/json',
    'Accept-Language': getlang(),
  };

  try {
    Response response;
    if (dioType == DioType.post) {
      response = await dio.post(
        path,
        data: data != null ? FormData.fromMap(data) : [],
      );
    } else {
      response = await dio.get(
        path,
      );
    }
    printWarningLong('log1 ${response.toString()}');

    return response;
  } on DioError catch (e) {

    showCustomFlash(text: 'netWorkMessage'.t) ;
    printWarning('log index ${e.type.index.toString()}');
    printWarning('log2 ${e.response.toString()}');
    printWarning('log2 ${e.message}');
    rethrow;
   // return null;
  } catch (e) {
    printWarning('log3 ${e.toString()}' );
    rethrow;
  //  return null;
  }finally {
    BotToast.closeAllLoading();
  }

}
Future apiAction(String url,

    {
      bool withLoader = false,
      bool withShowSuccess = false,
      Map<String, dynamic> data,
      DioType dioType = DioType.post}) async {
  try {
    Response response = await getResponse(
      url,
      withLoader,
      data: data,
      dioType: dioType,
    );
    var res = BaseResponse.fromJson(response.data,);
    if(res.status){
      if(withShowSuccess) showCustomFlash(text:res.message,messageType: MessageType.MESSAGE_SUCCESS) ;
    }else{
      showCustomFlash(text:res.message) ;
    }
    return res.status??false ;
  }catch (e) {
    return false;
    // TODO
  }
 // BotToast.showSimpleNotification(title: res.message) ;


}


Future getObjData(String url,
    {String key = 'items',
    dynamic Function(Map<String, dynamic> json) fun,
    bool withLoader = false,
    Map<String, dynamic> data,
    Function(dynamic) onSuccess ,
    Function(ErrorType error) onError ,
      bool showMessage = false ,
    DioType dioType = DioType.get}) async {
   try {
     printGreen(data?.toString());
     if(isAppTestMode){
       onSuccess('');
       return;
     }
    Response response = await getResponse(
      url,
      withLoader,
      data: data??{},
      dioType: dioType,
    );
    var res = BaseResponse.fromJson(response.data, keyObject: key, fun: fun);

    if (res.status) {
      if(onSuccess!=null){
        onSuccess(res.object);
      }
      if(showMessage){
        showCustomFlash(text: res.message,messageType: MessageType.MESSAGE_SUCCESS) ;
      }
      return res;
    } else {
      if(onError!=null){
        onError(ErrorType.NOT_SUCCESS);
      }
      showCustomFlash(text: res.message) ;

    }
  } on DioError catch (e) {
     if(onError!=null){
        if(e.type.index==5){
          onError(ErrorType.NO_INTERNET);
        }else{
          onError(ErrorType.CRASH_ERROR);
        }
     }
     printWarning('log index ${e.type.index.toString()}');
     log('log2 ${e.response.toString()}');

     // return null;
   }/*on Exception catch (e,s) {
    log('log4 ${s}') ;
    if(onError!=null){
      onError(ErrorType.CRASH_ERROR);
    }
  }*/ catch (e,s) {
     printWarning('log4 $e :: ${s}') ;
    if(onError!=null){
      onError(ErrorType.CRASH_ERROR);
    }
  }
}


Future getListData(String url,
    {String key ='items',
      String extraValueKey,
      dynamic Function(Map<String, dynamic> json) fun,
      dynamic Function(String value) extraValue,

      Map<String, dynamic> data,
      Function(List<dynamic> list) onSuccess ,
      Function(List<dynamic> list) onLast ,
      Function(ErrorType) onError ,
      bool withLoader = false}) async {
  try {
    Response response = await getResponse(
      url,
      withLoader,
      dioType: DioType.get,
    );
    var res = BaseResponse.fromJson(response.data,extraValueKey: extraValueKey, keyArray: key, fun: fun);

    if (res.status) {
      if(onSuccess!=null){

        if(res.isMore||onLast==null){
          onSuccess(res.arrayObject) ;
        }else {
          onLast(res.arrayObject) ;
        }
        if(extraValue!=null){
          extraValue(res.extraValue) ;
        }
      }
      return res;
    } else {
      if(onError!=null){
        onError(ErrorType.NOT_SUCCESS) ;
      }
    }
  }on DioError catch (e) {
    if(onError!=null){
      if(e.type.index==5||e.type.index==0){
        onError(ErrorType.NO_INTERNET);
      }else{
        onError(ErrorType.CRASH_ERROR);
      }
    }
  } catch (error,e) {
    if(onError!=null){
      onError(ErrorType.CRASH_ERROR);
    }
    printWarning(error.toString());
    printWarning(e.toString());

  }
}



Future getBaseData(String url,
    {String keyArray ='items',
     String keyObject ='item',
      dynamic Function(Map<String, dynamic> json) funForObject,
      dynamic Function(Map<String, dynamic> json) funForList,
      Map<String, dynamic> data,
      Function(List<dynamic> list) onSuccess ,
      Function(List<dynamic> list) onLast ,
      Function(ErrorType) onError ,
      bool withLoader = false}) async {
  try {
    Response response = await getResponse(
      url,
      withLoader,
      dioType: DioType.get,
    );
    var res = BaseResponse.fromJsonForBase(response.data, keyArray: keyArray,keyObject: keyObject, fun: funForObject,fun2:funForList);

    if (res.status) {
      if(onSuccess!=null){
        if(res.isMore||onLast==null){
          onSuccess(res.arrayObject) ;
        }else {
          onLast(res.arrayObject) ;
        }
      }
      return res;
    } else {
      if(onError!=null){
        onError(ErrorType.NOT_SUCCESS) ;

      }
    }
  }on DioError catch (e) {
    if(onError!=null){
      if(e.type.index==5||e.type.index==0){
        onError(ErrorType.NO_INTERNET);
      }else{
        onError(ErrorType.CRASH_ERROR);
      }
    }
  } catch (error,e) {
    if(onError!=null){
      onError(ErrorType.CRASH_ERROR);
    }
    printWarning(error.toString());
    printWarning(e.toString());

  }
}


void printWarningLong(String text) {
  print('\x1B[33m//////////////////////////////////////////////////////////////////////////\x1B[0m');
  log(text) ;

  print('\x1B[37m''\x1B[0m');
}
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
  log(text) ;
  print('\x1B[37m''\x1B[0m');
}
void printGreen(String text) {
  print('\x1B[32m$text\x1B[0m');
  print('\x1B[37m''\x1B[0m');
}
void printBlue(String text) {
  print('\x1B[34m$text\x1B[0m');
  print('\x1B[37m''\x1B[0m');
}