

class BaseResponse {
    BaseResponse({
        this.status,
        this.code,
        this.message,
        this.object,
        this.arrayObject,
        this.extraValue,
        this.selfAssessmentID,
        this.isMore,
    });

    bool status;
    int code;
    String message;
    String selfAssessmentID = '0';
    dynamic object;
    dynamic extraValue;
    List<dynamic> arrayObject;
    bool isMore =false;


    factory BaseResponse.fromJson( Map<String, dynamic> json , {String keyObject='' ,keyArray = '',extraValueKey, dynamic Function(Map<String, dynamic> json) fun }) => BaseResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        extraValue:extraValueKey!=null? json[extraValueKey]:null,
        selfAssessmentID: json["selfAssessmentID"].toString()??'0',
        object: json[keyObject]!=null?json[keyObject]is String?json[keyObject]: fun(json[keyObject]):null,
        arrayObject: json[keyArray]!=null?List<dynamic>.from(json[keyArray].map((x) =>fun(x) )): null,
        isMore: json["is_more"]??false,
    );

    factory BaseResponse.fromJsonForBase( Map<String, dynamic> json , {String keyObject='' ,keyArray = '', dynamic Function(Map<String, dynamic> json) fun ,dynamic Function(Map<String, dynamic> json) fun2}) => BaseResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        selfAssessmentID: json["selfAssessmentID"].toString()??'0',
        object: json[keyObject]!=null?json[keyObject]is String?json[keyObject]: fun(json[keyObject]):null,
        arrayObject: json[keyArray]!=null?List<dynamic>.from(json[keyArray].map((x) =>fun2(x) )): null,
        isMore: json["is_more"]??false,
    );
}
