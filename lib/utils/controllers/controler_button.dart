
import 'package:etr/utils/enums.dart';

class ButtonController {
  Function(bool) setIsLoader ;
}


class GenderController {

  Gender gender  = Gender.female ;
  get genderStr=> gender==Gender.female?'female':'male' ;
  Function(Gender) setGenderType;

}
class CallTypeController {

  CallType callType  = CallType.voiceCall ;
  get isVideo=> callType==CallType.videoCall;
  Function(CallType) setcallType;

}
class DropDawnListController {

  dynamic _selectObj  ;
  dynamic get selectedObj => _selectObj;

  set selectedObj(dynamic value) {
    _selectObj = value;
  }

 Function(List<dynamic> list) updateList ;
 Function() clean ;
}

class MyListViewController {

  Function(dynamic) addItem ;
  Function(dynamic) stateLastItem ;
  Function(int) removeItem ;
}